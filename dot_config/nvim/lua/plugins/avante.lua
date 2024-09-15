return {
  "yetone/avante.nvim",
  cmd = "AvanteAsk",
  keys = { "<leader>q", "<CMD>AvanteAsk<CR>", desc = "Open avante" },
  build = "make",
  opts = {
    mappings = {
      ask = "<leader>q",
      edit = "<F25>",
      refresh = "<F26>",
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        none = "c0",
        both = "cb",
        next = "]x",
        prev = "[x",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
    },
  },
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "stevearc/dressing.nvim",      lazy = true },
    { "nvim-lua/plenary.nvim",       lazy = true },
    { "MunifTanjim/nui.nvim",        lazy = true },
    --- The below is optional, make sure to setup it properly if you have lazy=true
    -- {
    --   'MeanderingProgrammer/render-markdown.nvim',
    --   opts = {
    --     file_types = { "markdown", "Avante" },
    --   },
    --   ft = { "markdown", "Avante" },
    -- },
  },
}
