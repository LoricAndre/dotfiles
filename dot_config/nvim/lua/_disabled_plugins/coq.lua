-- https://github.com/ms-jpq/coq_nvim/issues/589 for syntax error on windows
return {
  "ms-jpq/coq_nvim",
  enabled = false,
  branch = "coq",
  dependencies = {
    { "ms-jpq/coq.artifacts",  branch = "artifacts" },
    { "ms-jpq/coq.thirdparty", branch = "3p" }
  },
  config = function()
    vim.g.coq_settings = {
      auto_start = "shut-up",
    }
    require("coq")
  end,
  build = ":COQdeps",
  event = "VeryLazy"
}
