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

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    close_on_exit = true,
    size = function(t)
      if t.direction == 'horizontal' then
        return vim.o.lines * 0.25
      else
        return vim.o.columns * 0.35
      end
    end,
    on_create = function(t)
      vim.api.nvim_create_autocmd('BufEnter', {
        group = vim.api.nvim_create_augroup(
          'custom_toggleterm_' .. t.id,
          { clear = true }
        ),
        command = 'startinsert',
        buffer = t.bufnr,
      })
      vim.cmd.startinsert()
    end,
    on_open = function(t)
      if _G.term_hist == nil then
        _G.term_hist = {}
      end
      for i, v in ipairs(_G.term_hist) do
        if v == t.id then
          _G.term_hist[i] = nil
        end
      end
      _G.term_hist[#_G.term_hist + 1] = t.id
    end,
    on_exit = function(t)
      for i, v in ipairs(_G.term_hist) do
        if v == t.id then
          _G.term_hist[i] = nil
        end
      end
      open_last()
      t:close()
    end,
  },
  config = function(_, opts)
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
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd('startinsert!')
      end,
    })

    function _G.lazygit_toggle()
      lazygit:toggle()
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
      '<C-t>',
      function()
        local tt = require('toggleterm.terminal')
        local curr = tt.get(tt.get_focused_id())
        if curr then
          local t = tt.get_or_create_term(#tt.get_all(true) + 1)
          t:open()
          curr:close()
        end
      end,
      mode = 't',
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
    },
  },
}
