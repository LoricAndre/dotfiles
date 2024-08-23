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
    dap = false,
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
    { "<leader>rr", "<CMD>OverseerRun<CR>",    noremap = true, desc = "[ovs] run" },
    { "<leader>rt", "<CMD>OverseerToggle<CR>", noremap = true, desc = "[ovs] run" },
    { "<leader>ra", "<CMD>OverseerTaskAction<CR>", noremap = true, desc = "[ovs] run" },
  }
}
