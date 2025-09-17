return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
    'TmuxNavigatorProcessList',
  },
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
  end,
  keys = {
    {
      '<M-h>',
      '<cmd>TmuxNavigateLeft<cr>',
      desc = '[tmx] navigate left',
    },
    {
      '<M-j>',
      '<cmd>TmuxNavigateDown<cr>',
      desc = '[tmx] navigate down',
    },
    {
      '<M-k>',
      '<cmd>TmuxNavigateUp<cr>',
      desc = '[tmx] navigate up',
    },
    {
      '<M-l>',
      '<cmd>TmuxNavigateRight<cr>',
      desc = '[tmx] navigate right',
    },
    {
      '<M-h>',
      '<C-\\><C-n><cmd>TmuxNavigateLeft<cr>',
      mode = 't',
      desc = '[tmx] navigate left',
    },
    {
      '<M-j>',
      '<C-\\><C-n><cmd>TmuxNavigateDown<cr>',
      mode = 't',
      desc = '[tmx] navigate down',
    },
    {
      '<M-k>',
      '<C-\\><C-n><cmd>TmuxNavigateUp<cr>',
      mode = 't',
      desc = '[tmx] navigate up',
    },
    {
      '<M-l>',
      '<C-\\><C-n><cmd>TmuxNavigateRight<cr>',
      mode = 't',
      desc = '[tmx] navigate right',
    },
  },
}
