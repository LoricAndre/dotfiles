return {
  'sindrets/diffview.nvim',
  cmd = {
    'DiffviewOpen',
    'DiffviewClose',
    'DiffviewToggleFiles',
    'DiffviewFocusFiles',
    'DiffviewRefresh',
    'DiffviewFileHistory',
  },
  keys = {
    {
      '<leader>go',
      '<CMD>DiffviewOpen<CR>',
      mode = { 'n', 'v' },
      desc = '[git] open diff view',
    },
    {
      '<leader>gm',
      '<CMD>DiffviewFileHistory<CR>',
      mode = { 'n', 'v' },
      desc = '[git] open file history',
    },
    {
      '<leader>gc',
      '<CMD>DiffviewClose<CR>',
      mode = { 'n', 'v' },
      desc = '[git] close diff view',
    },
  },
  opts = {},
}
