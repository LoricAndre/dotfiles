return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "rrethy/nvim-treesitter-textsubjects"
  },
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
        node_incremental = "vn",
        node_decremental = "vd"
      },
    },
    indent = {
      enable = true
    },
  }
}
