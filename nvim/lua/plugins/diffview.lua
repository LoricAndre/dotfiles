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
    { '<leader>gd', '<CMD>DiffviewOpen<CR>', mode = { 'n', 'v' } },
    { '<leader>gm', '<CMD>DiffviewFileHistory<CR>', mode = { 'n', 'v' } },
    { '<leader>gc', '<CMD>DiffviewClose<CR>', mode = { 'n', 'v' } },
  },
  opts = {},
}
