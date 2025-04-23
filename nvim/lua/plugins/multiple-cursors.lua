return {
  'brenton-leighton/multiple-cursors.nvim',
  version = '*', -- Use the latest tagged version
  opts = {}, -- This causes the plugin setup function to be called
  keys = {
    {
      '<C-k>',
      '<Cmd>MultipleCursorsAddDown<CR>',
      mode = { 'n', 'x' },
      desc = '[mcs] add cursor and move down',
    },
    {
      '<C-l>',
      '<Cmd>MultipleCursorsAddUp<CR>',
      mode = { 'n', 'x' },
      desc = '[mcs] add cursor and move up',
    },

    {
      '<C-Up>',
      '<Cmd>MultipleCursorsAddUp<CR>',
      mode = { 'n', 'i', 'x' },
      desc = '[mcs] add cursor and move up',
    },
    {
      '<C-Down>',
      '<Cmd>MultipleCursorsAddDown<CR>',
      mode = { 'n', 'i', 'x' },
      desc = '[mcs] add cursor and move down',
    },

    {
      '<C-LeftMouse>',
      '<Cmd>MultipleCursorsMouseAddDelete<CR>',
      mode = { 'n', 'i' },
      desc = '[mcs] add or remove cursor',
    },

    {
      '<Leader>ml',
      '<Cmd>MultipleCursorsAddVisualArea<CR>',
      mode = { 'x' },
      desc = '[mcs] add cursors to the lines of the visual area',
    },

    {
      '<Leader>mm',
      '<Cmd>MultipleCursorsAddMatches<CR>',
      mode = { 'n', 'x' },
      desc = '[mcs] add cursors to cword',
    },
    {
      '<Leader>mM',
      '<Cmd>MultipleCursorsAddMatchesV<CR>',
      mode = { 'n', 'x' },
      desc = '[mcs] add cursors to cword in previous area',
    },

    {
      '<Leader>mj',
      '<Cmd>MultipleCursorsAddJumpNextMatch<CR>',
      mode = { 'n', 'x' },
      desc = '[mcs] add cursor and jump to next cword',
    },
    {
      '<Leader>mJ',
      '<Cmd>MultipleCursorsJumpNextMatch<CR>',
      mode = { 'n', 'x' },
      desc = '[mcs] jump to next cword',
    },

    {
      '<Leader>mL',
      '<Cmd>MultipleCursorsLock<CR>',
      mode = { 'n', 'x' },
      desc = '[mcs] lock virtual cursors',
    },
  },
}
