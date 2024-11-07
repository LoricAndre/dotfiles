return {
  'stevearc/overseer.nvim',
  event = 'VeryLazy',
  dependencies = {
    { 'stevearc/dressing.nvim', lazy = true },
  },
  opts = {
    dap = false, --  if enabled, this will load dap and slow startup by ~60ms
    -- strategy = {
    --   'toggleterm',
    --   direction = 'vertical',
    --   auto_scroll = true,
    --   close_on_exit = false,
    --   quit_on_exit = 'never',
    --   open_on_start = true,
    --   hidden = true,
    -- },
    strategy = {
      'jobstart'
    },
    templates = {
      'builtin',
      'docker.compose',
    },
    task_list = {
      direction = 'right',
      max_width = { 75, 0.2 },
    },
  },
  keys = {
    {
      '<leader>rr',
      '<CMD>OverseerRun<CR>',
      noremap = true,
      desc = '[ovs] run',
    },
    {
      '<leader>rt',
      '<CMD>OverseerToggle<CR>',
      noremap = true,
      desc = '[ovs] run',
    },
    {
      '<leader>ra',
      '<CMD>OverseerTaskAction<CR>',
      noremap = true,
      desc = '[ovs] run',
    },
  },
}
