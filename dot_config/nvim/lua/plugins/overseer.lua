return {
  'stevearc/overseer.nvim',
  event = "VeryLazy",
  opts = {
    strategy = {
      "toggleterm",
      direction = "horizontal"
    },
    templates = {
      "builtin",
      "pulumi",
      "docker"
    }
  },
  keys = {
    { "<leader>or", "<CMD>OverseerRun<CR>", noremap = true, desc = "[OVS] Run"},
    { "<leader>oo", "<CMD>OverseerToggle<CR>", noremap = true, desc = "[OVS] Toggle"},
  }
}
