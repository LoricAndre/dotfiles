return {
  "coffebar/neovim-project",
  opts = {
    projects = { -- define project roots
      "~/src/*",
      "~/ghq/*/*/*",
      "~/ghq/*/*/*/*/*",
      "~/dt",
    },
    last_session_on_startup = true,
    -- Dashboard mode prevent session autoload on startup
    dashboard_mode = true,
  },
  cond = false,
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.

  end,
  keys = {
    { "<leader>p", "<CMD>Telescope neovim-project<CR>", desc = "Projects" },
    { "<leader>P", "<CMD>Telescope neovim-project discover<CR>", desc = "Find projects" },

  },
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    -- { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "Shatur/neovim-session-manager", config = function() require("session_manager").setup({}) end },
  },
  lazy = false,
  priority = 100,
}
