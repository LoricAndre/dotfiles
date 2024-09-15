return {
  "OXY2DEV/markview.nvim",
  ft = "markdown", -- If you decide to lazy-load anyway

  dependencies = {
    -- You will not need this if you installed the
    -- parsers manually
    -- Or if the parsers are in your $RUNTIMEPATH
    { "nvim-treesitter/nvim-treesitter", lazy = true },

    { "nvim-tree/nvim-web-devicons",     lazy = true },
  }
}
