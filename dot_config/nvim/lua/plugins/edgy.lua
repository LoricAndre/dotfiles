return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>e", function()
      require("neo-tree.command").execute({ action = "close" })
      require("edgy").toggle()
    end },
  },
  opts = {
    bottom = {
      {
        ft = "toggleterm",
        open = "ToggleTerm",
        size = {
          height = 0.3,
        },
        filter = function(_, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
        pinned = true,
      },
      "Trouble",
      { ft = "qf", title = "QuickFix" },
    },
    left = {
      {
        title = "NeoTree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.75 },
        pinned = true,
        open = "Neotree show"
      },
      "neo-tree",
    },
    animate = { enabled = false }
  }
}
