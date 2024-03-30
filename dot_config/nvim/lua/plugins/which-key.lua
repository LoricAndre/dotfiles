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
      ["<leader>c"] = { name = "+code" },
      ["<leader>g"] = { name = "+git" },
      ["<leader>q"] = { name = "+trouble" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>d"] = { name = "+debug" },
      -- ["<leader>r"] = { name = "+sniprun" },
      ["gc"] = { name = "+comment" },
    })
    return wk.setup()
  end
}
