return {
  'brenton-leighton/multiple-cursors.nvim',
  version = '*',
  opts = {},
  keys = {
    { '<C-k>', '<Cmd>MultipleCursorsAddDown<CR>' },
    { '<C-Down>', '<Cmd>MultipleCursorsAddDown<CR>', mode = { 'n', 'i' } },
    { '<C-l>', '<Cmd>MultipleCursorsAddUp<CR>' },
    { '<C-Up>', '<Cmd>MultipleCursorsAddUp<CR>', mode = { 'n', 'i' } },
    {
      '<C-LeftMouse>',
      '<Cmd>MultipleCursorsMouseAddDelete<CR>',
      mode = { 'n', 'i' },
    },
    {
      '<leader>m',
      '<Cmd>MultipleCursorsAddMatches<CR>',
      mode = { 'n', 'x' },
      desc = '[multicursor] add matches',
    },
  },
}
