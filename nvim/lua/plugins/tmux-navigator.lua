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
    { '<M-h>', '<cmd>TmuxNavigateLeft<cr>', mode = { 'n', 't' } },
    { '<M-j>', '<cmd>TmuxNavigateDown<cr>', mode = { 'n', 't' } },
    { '<M-k>', '<cmd>TmuxNavigateUp<cr>', mode = { 'n', 't' } },
    { '<M-l>', '<cmd>TmuxNavigateRight<cr>', mode = { 'n', 't' } },
  },
}
