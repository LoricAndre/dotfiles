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
  keys = {
    {
      '<M-h>',
      '<cmd>TmuxNavigateLeft<cr>',
      mode = { 'n', 't' },
      desc = '[tmx] navigate left',
    },
    {
      '<M-j>',
      '<cmd>TmuxNavigateDown<cr>',
      mode = { 'n', 't' },
      desc = '[tmx] navigate down',
    },
    {
      '<M-k>',
      '<cmd>TmuxNavigateUp<cr>',
      mode = { 'n', 't' },
      desc = '[tmx] navigate up',
    },
    {
      '<M-l>',
      '<cmd>TmuxNavigateRight<cr>',
      mode = { 'n', 't' },
      desc = '[tmx] navigate right',
    },
  },
}
