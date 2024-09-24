return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'vn',
          node_incremental = 'vn',
          node_decremental = 'vd',
        },
      },
      indent = {
        enable = true,
      },
    },
    event = 'VeryLazy',
  },
  {
    'kiyoon/treesitter-indent-object.nvim',
    keys = {
      {
        'ai',
        function()
          require('treesitter_indent_object.textobj').select_indent_outer()
        end,
        mode = { 'x', 'o' },
        desc = 'Select context-aware indent (outer)',
      },
      {
        'aI',
        function()
          require('treesitter_indent_object.textobj').select_indent_outer(true)
        end,
        mode = { 'x', 'o' },
        desc = 'Select context-aware indent (outer, line-wise)',
      },
      {
        'ii',
        function()
          require('treesitter_indent_object.textobj').select_indent_inner()
        end,
        mode = { 'x', 'o' },
        desc = 'Select context-aware indent (inner, partial range)',
      },
      {
        'iI',
        function()
          require('treesitter_indent_object.textobj').select_indent_inner(
            true,
            'V'
          )
        end,
        mode = { 'x', 'o' },
        desc = 'Select context-aware indent (inner, entire range) in line-wise visual mode',
      },
    },
  },
}
