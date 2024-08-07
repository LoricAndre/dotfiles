return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>g", group = "+git" },
      { "<leader>q", group = "+trouble" },
      { "<leader>u", group = "+ui" },
      { "<leader>d", group = "+debug" },
      { "<leader>l", group = "+log" },
      { "<leader>t", group = "+neotree" },
      { "<leader>s", group = "+telescope" },
      { "gc", group = "+comment" },
      { "gw", group = "+swap" },
    })
    return wk.setup()
  end
}
