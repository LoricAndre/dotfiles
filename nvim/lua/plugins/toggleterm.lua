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
  -- dependencies = {
  --   {
  --     'ryanmsnyder/toggleterm-manager.nvim',
  --     dependencies = {
  --       'akinsho/nvim-toggleterm.lua',
  --       'nvim-telescope/telescope.nvim',
  --       'nvim-lua/plenary.nvim', -- only needed because it's a dependency of telescope
  --     },
  --     enabled = vim.g.picker == 'telescope',
  --     keys = {
  --       { '<leader>t', function() require('toggleterm-manager').open({}) end }
  --     },
  --     opts = {
  --       mappings = {
  --         i = {
  --           ['<CR>'] = {
  --             action = function(prompt_bufnr, exit_on_action)
  --               -- get current telescope selection
  --               local actions_state = require('telescope.actions.state')
  --               local selection = actions_state.get_selected_entry()
  --               if selection == nil then
  --                 return
  --               end
  --
  --               local terms = require('toggleterm.utils').list
  --
  --               -- get toggleterm's Terminal object
  --               local term = selection.value
  --
  --               -- do something with the terminal
  --               term:open()
  --             end,
  --             exit_on_action = true
  --           }
  --         }
  --       }
  --     }
  --   }
  -- },
  version = '*',
  cmd = {
    'ToggleTerm',
    'TermSelect'
  },
  opts = {
    winbar = {
      enabled = true
    },
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
      vim.notify('On open')
      local terms = require('toggleterm.terminal').get_all(true)
      for _, term in ipairs(terms) do
        if term.bufnr ~= t.bufnr then
          vim.notify('Closing term' .. (term.display_name or term.bufnr))
          term:close()
        else
          vim.notify('Not closing term' .. (term.display_name or term.bufnr))
        end
      end
      vim.cmd.startinsert()
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
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd('startinsert!')
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
      -- function to run on closing the terminal
      on_close = function(term)
        vim.cmd('startinsert!')
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
