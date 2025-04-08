return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    {
      'RRethy/nvim-treesitter-textsubjects',
      lazy = true,
      after = 'nvim-treesitter',
    },
  },
  build = ':TSUpdate',
  event = 'FileType',
  opts = {
    ensure_installed = { 'yaml', 'markdown' },
    auto_install = true,
    highlight = { enable = true },
    incremental_selection = {
      enable = false,
    },
    indent = { enable = true },
    textsubjects = {
      enable = true,
      prev_selection = ',', -- (Optional) keymap to select the previous selection
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = {
          'textsubjects-container-inner',
          desc = 'Select inside containers (classes, functions, etc.)',
        },
      },
    },
  },
  config = function(_, opts)
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    return require('nvim-treesitter.configs').setup(opts)
  end,
}
