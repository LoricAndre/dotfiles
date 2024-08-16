local trigger = "<F11>"
return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  keys = {
    {
      trigger,
      function()
        require("edgy").toggle()
        vim.defer_fn(require("edgy").goto_main, 20)
      end,
      desc = "[edgy] toggle"
    }
  },
  opts = {
    bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
      {
        ft = "toggleterm",
        size = { height = 0.25 },
        -- exclude floating windows
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
        pinned = true,
        open = "ToggleTerm"
      },
      "Trouble",
      { ft = "qf",            title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      { ft = "spectre_panel", size = { height = 0.4 } },
    },
    left = {
      -- Neo-tree filesystem always takes half the screen height
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        pinned = true,
        size = { height = 0.5 },
        open = "Neotree"
      },
      "neo-tree",
    },
    animate = {
      enabled = false
    }
  },
}
