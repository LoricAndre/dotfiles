return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',  -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'ibhagwan/fzf-lua',       -- optional
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>gn', function() require('neogit').open({ kind = 'split' }) end, desc = '[git] open neogit' }
  }
}
