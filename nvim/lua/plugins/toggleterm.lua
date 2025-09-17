local function focus_term(id)
  local tt = require('toggleterm.terminal')
  local curr = tt.get(tt.get_focused_id())
  local target = tt.get(id, true)
  if target then
    if curr then
      curr:close()
    end
    target:open()
  end
end
local function open_last()
  local i = #_G.term_hist
  local curr = require('toggleterm.terminal').get_focused_id()
  while _G.term_hist ~= nil and i > 0 do
    if _G.term_hist[i] == curr then
      i = i - 1
    else
      focus_term(_G.term_hist[i])
      break
    end
  end
end

local function term_size(t)
  if t.direction == 'horizontal' then
    return math.floor(vim.o.lines * 0.25)
  elseif t.direction == 'vertical' then
    return math.floor(vim.o.columns * 0.35)
  end
end

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  cmd = {
    'ToggleTerm',
    'TermSelect'
  },
  opts = {
    winbar = {
      enabled = true
    },
    start_in_insert = false,
    size = term_size,
    on_open = function(t)
      if t.hidden then
        return
      end
      vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup(
          'custom_toggleterm_' .. t.id,
          { clear = true }
        ),
        callback = function()
          vim.defer_fn(function()
            if pcall(vim.api.nvim_set_current_win, t.window) then
              vim.cmd.startinsert()
            end
          end, 100)
        end,
        buffer = t.bufnr,
      })
      vim.keymap.set({ 'i', 't' }, 'Ȥ', function()
        local terms = require('toggleterm.terminal').get_all(true)
        local found = false
        for _, term in ipairs(terms) do
          if found then
            focus_term(term.id)
            return
          end
          if term.id == t.id then
            found = true
          end
        end
        if #terms > 0 then
          focus_term(terms[1].id)
        end
      end, {
        buffer = t.bufnr
      })
      vim.keymap.set({ 'i', 't' }, 'ȥ', function()
        local terms = require('toggleterm.terminal').get_all(true)
        local prev_id = nil
        for _, term in ipairs(terms) do
          if term.id == t.id and prev_id ~= nil then
            focus_term(prev_id)
            return
          end
          prev_id = term.id
        end
        if #terms > 0 then
          focus_term(terms[#terms].id)
        end
      end, {
        buffer = t.bufnr
      })
      if _G.term_hist == nil then
        _G.term_hist = {}
      end
      for i, v in ipairs(_G.term_hist) do
        if v == t.id then
          _G.term_hist[i] = nil
        end
      end
      _G.term_hist[#_G.term_hist + 1] = t.id
      local terms = require('toggleterm.terminal').get_all(true)
      for _, term in ipairs(terms) do
        if term.bufnr ~= t.bufnr then
          term:close()
        else
        end
      end
      local size = term_size(t)
      if t.direction == 'vertical' then
        vim.api.nvim_win_set_width(t.window, size)
      elseif t.direction == 'horizontal' then
        vim.api.nvim_win_set_height(t.window, size)
      end
    end,
    on_close = function(t)
      if t.hidden then
        return
      end
      for i, v in ipairs(_G.term_hist) do
        if v == t.id then
          _G.term_hist[i] = nil
        end
      end
      open_last()
    end,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
      cmd = 'lazygit',
      hidden = true,
      direction = 'float',
      float_opts = {
        width = math.floor(vim.o.columns * 0.70),
        height = math.floor(vim.o.lines * 0.70),
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd('startinsert!')
        vim.api.nvim_buf_set_keymap(
          term.bufnr,
          'n',
          'q',
          '<cmd>close<CR>',
          { noremap = true, silent = true }
        )
      end,
    })
    local jjui = Terminal:new({
      cmd = 'jjui -r "present(@) | ancestors(immutable_heads().., 100) | present(trunk())"',
      hidden = true,
      direction = 'float',
      float_opts = {
        width = math.floor(vim.o.columns * 0.70),
        height = math.floor(vim.o.lines * 0.70),
      },
      -- function to run on opening the terminal
      on_open = function(term)
        vim.cmd('startinsert!')
        vim.api.nvim_buf_set_keymap(
          term.bufnr,
          'n',
          'q',
          '<cmd>close<CR>',
          { noremap = true, silent = true }
        )
      end,
    })

    function _G.lazygit_toggle()
      lazygit:toggle()
    end

    function _G.jjui_toggle()
      jjui:toggle()
    end
  end,
  keys = {
    {
      '<C-t>',
      function()
        require('toggleterm').toggle()
      end,
      mode = 'n',
    },
    {
      '<leader>t', '<CMD>TermSelect<CR>'
    },
    {
      '<C-a>',
      function()
        open_last()
      end,
      mode = 't',
    },
    {
      '<leader>gg',
      function()
        _G.lazygit_toggle()
      end,
      desc = '[git] toggle lazygit'
    },
    {
      '<leader>gh',
      function()
        _G.jjui_toggle()
      end,
      desc = '[jj] toggle jjui'
    },
  },
}
