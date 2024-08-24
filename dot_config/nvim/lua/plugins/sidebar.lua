return {
  "sidebar-nvim/sidebar.nvim",
  enabled = false,
  opts = {
    open = false,
    sections = {
      "files",
      "git",
      "symbols",
      "diagnostics",
      "todos"
    },
    files = {
      ignored_paths = {
        "%.git$",
        "%node_modules$",
      },
    }
  },
  keys = {
    { "<leader>w", function() require("sidebar-nvim").toggle() end, desc = "[sidebar] open" }
  }
}
