return {
  'stevearc/overseer.nvim',
  event = "VeryLazy",
  opts = {
    -- strategy = {
    --   "jobstart",
    --   use_terminal = false
    -- },
    -- strategy = {
    --   "toggleterm",
    --   direction = "horizontal"
    -- },
    templates = {
      "builtin",
      "docker.compose"
    }
  },
  keys = {
    { "<leader>or", "<CMD>OverseerRun<CR>", noremap = true, desc = "[OVS] Run"},
    { "<leader>oo", "<CMD>OverseerToggle<CR>", noremap = true, desc = "[OVS] Toggle"},
  }
}
