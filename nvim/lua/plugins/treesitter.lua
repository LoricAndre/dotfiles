return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    opts = {},
    config = function(_, opts)
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

      local ts = require('nvim-treesitter')

      return ts.setup(opts)
    end,
  },
  {
    'aaronik/treewalker.nvim',
    opts = {
      highlight = true,
      highlight_duration = 250,
      highlight_group = 'CursorLine',
      jumplist = true,
    },
    event = 'VeryLazy',
    config = function(_, opts)
      local function tw_map(keys, act)
        vim.keymap.set(
          { 'n', 'v' },
          keys,
          function() require('treewalker')[act]() end,
          { buffer = true, desc = '[tw] ' .. act }
        )
      end

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('custom_treewalker', { clear = true }),
        callback = function()
          local ok = pcall(vim.treesitter.get_parser)
          if ok then
            require('treewalker').setup(opts)
            tw_map('<C-l>', 'move_up')
            tw_map('<C-k>', 'move_down')
            tw_map('<C-j>', 'move_out')
            tw_map('<C-m>', 'move_in')
            tw_map('ȡ', 'swap_down')
            tw_map('Ȣ', 'swap_up')
            tw_map('Ƞ', 'swap_left')
            tw_map('ȣ', 'swap_right')
          end
        end
      })
    end,
  },
}
