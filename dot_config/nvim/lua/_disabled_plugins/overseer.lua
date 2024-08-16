return {
  'stevearc/overseer.nvim',
  event = "VeryLazy",
  dependencies = {
    "stevearc/dressing.nvim"
  },
  opts = {
    -- strategy = {
    --   "jobstart",
    --   use_terminal = false
    -- },
    strategy = {
      "toggleterm",
      direction = "float"
    },
    templates = {
      "builtin",
      "docker.compose"
    },
    task_list = {
      direction = "right",
      max_width = { 75, 0.2 },
    }
  },
  keys = {
    { "<leader>or", "<CMD>OverseerRun<CR>",    noremap = true, desc = "[OVS] Run" },
    { "<leader>oo", "<CMD>OverseerToggle<CR>", noremap = true, desc = "[OVS] Toggle" },
  }
}
