return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  keys = {
    {"<leader>e", function() require("edgy").toggle() end},
  },
  opts = {
    open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
    bottom = {
      {
        ft = "toggleterm",
        open = "ToggleTerm",
        size = { height = 0.3 },
        filter = function(_, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
        pinned = true,
      },
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
    },
    left = {
      -- Neo-tree filesystem always takes half the screen height
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.75 },
        pinned = true,
        open = "Neotree reveal",
      },
      -- {
      --   ft = "Trouble",
      --   open = "Trouble workspace_diagnostics",
      --   pinned = true
      -- },
      "neo-tree",
    },
    animate = {enabled = false}
  }
}
