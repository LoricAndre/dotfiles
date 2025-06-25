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
    keys = {
      {
        '<C-k>',
        '<CMD>Treewalker Down<CR>',
        { mode = { 'n', 'v' }, desc = '[tw] walk down' },
      },
      {
        '<C-l>',
        '<CMD>Treewalker Up<CR>',
        { mode = { 'n', 'v' }, desc = '[tw] walk up' },
      },
      {
        '<C-j>',
        '<CMD>Treewalker Left<CR>',
        { mode = { 'n', 'v' }, desc = '[tw] walk left' },
      },
      {
        '<C-m>',
        '<CMD>Treewalker Right<CR>',
        { mode = { 'n', 'v' }, desc = '[tw] walk right' },
      },
      -- Mappings below are allowed by remapping the corresponding keys in kitty.conf
      {
        'ȡ', -- <C-S-k> = \u0221
        '<CMD>Treewalker SwapDown<CR>',
        { mode = { 'n', 'v' }, desc = '[tw] swap down' },
      },
      {
        'Ȣ', -- <C-S-l> = \u0222
        '<CMD>Treewalker SwapUp<CR>',
        { mode = { 'n', 'v' }, desc = '[tw] swap up' },
      },
      {
        'Ƞ', -- <C-S-j> = \u0220
        '<CMD>Treewalker SwapLeft<CR>',
        { mode = { 'n', 'v' }, desc = '[tw] swap left' },
      },
      {
        'ȣ', -- <C-S-m> = \u0223
        '<CMD>Treewalker SwapRight<CR>',
        { mode = { 'n', 'v' }, desc = '[tw] swap right' },
      },
    },
  },
}
