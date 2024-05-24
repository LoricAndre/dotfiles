return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>g"] = { name = "+git" },
      ["<leader>q"] = { name = "+trouble" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>d"] = { name = "+debug" },
      ["<leader>l"] = { name = "+log" },
      ["<leader>t"] = { name = "+neotree" },
      ["<leader>s"] = { name = "+telescope" },
      ["gc"] = { name = "+comment" },
      ["gw"] = { name = "+swap" },
    })
    return wk.setup()
  end
}
