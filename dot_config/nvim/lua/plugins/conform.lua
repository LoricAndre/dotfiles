return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      cs = {"astyle"},
      python = {"autopep8"}
    }
  },
  event = "VeryLazy",
  keys = {
    { "<leader>cf", function() return require("conform").format({ async = true }) end,  desc = "[LSP] Format" },
    { "<leader>cf", function() return require("conform").format({ async = true }) end,  mode = "v", desc = "[LSP] Format" }
  },
  enabled = false
}
