local map = require('util').map
local cmds = require('util').lazy_cmds

map({
      '<M-h>',
      '<cmd>TmuxNavigateLeft<cr>',
      mode = { 'n', 't' },
      desc = '[tmx] navigate left',
    })
map({
      '<M-j>',
      '<cmd>TmuxNavigateDown<cr>',
      mode = { 'n', 't' },
      desc = '[tmx] navigate down',
    })
map({
      '<M-k>',
      '<cmd>TmuxNavigateUp<cr>',
      mode = { 'n', 't' },
      desc = '[tmx] navigate up',
    })
map({
      '<M-l>',
      '<cmd>TmuxNavigateRight<cr>',
      mode = { 'n', 't' },
      desc = '[tmx] navigate right',
    })


cmds('vim-tmux-navigator', {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
    'TmuxNavigatorProcessList',
})
