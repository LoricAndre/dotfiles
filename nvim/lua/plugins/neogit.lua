return {
  'NeogitOrg/neogit',
  enabled = false,
  dependencies = {
    'nvim-lua/plenary.nvim',  -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'ibhagwan/fzf-lua',       -- optional
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>gn', function() require('neogit').open({ kind = 'floating' }) end, desc = '[git] open neogit' }
  }
}
