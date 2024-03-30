return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "vn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm"
      },
    },
    indent = {
      enable = true
    }
  },
  event = "VeryLazy"
}
