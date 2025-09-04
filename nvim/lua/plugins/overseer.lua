return {
  'stevearc/overseer.nvim',
  opts = {
    strategy = 'toggleterm',
    dap = false
  },
  cmd = {
    'OverseerOpen',
    'OverseerClose',
    'OverseerToggle',
    'OverseerSaveBundle',
    'OverseerLoadBundle',
    'OverseerDeleteBundle',
    'OverseerRunCmd',
    'OverseerRun',
    'OverseerInfo',
    'OverseerBuild',
    'OverseerQuickAction',
    'OverseerTaskAction',
    'OverseerClearCache',
  },
  keys = {
    { '<leader>r', '<CMD>OverseerRun<CR>', desc = '[ovs] open task runner' },
    -- { '<leader>rt', '<CMD>OverseerToggle<CR>', desc = '[ovs] toggle overseer output' },
    -- { '<leader>ro', '<CMD>OverseerOpen<CR>',   desc = '[ovs] open overseer output' },
    -- { '<leader>rc', '<CMD>OverseerClose<CR>',  desc = '[ovs] close overseer output' },
  }
}
