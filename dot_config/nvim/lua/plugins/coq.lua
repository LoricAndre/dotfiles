-- https://github.com/ms-jpq/coq_nvim/issues/589 for syntax error on windows
return {
  "ms-jpq/coq_nvim",
  cond = require("settings").s_completion == "coq",
  branch = "coq",
  dependencies = {
    { "ms-jpq/coq.artifacts",  branch = "artifacts", lazy = true },
    { "ms-jpq/coq.thirdparty", branch = "3p",        lazy = true }
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
