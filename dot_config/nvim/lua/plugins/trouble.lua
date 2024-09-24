return {
  'folke/trouble.nvim',
  enabled = false,
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  opts = {
    action_keys = {
      previous = 'l',
      next = 'k',
    },
  },
  cmd = {
    'Trouble',
    'TroubleToggle',
  },
  keys = {
    {
      '<leader>qt',
      function() require('trouble').toggle() end,
      desc = '[TROUBLE] Toggle',
    },
    {
      '<leader>qd',
      function() require('trouble').toggle('document_diagnostics') end,
      desc = '[TROUBLE] Toggle Diagnostics',
    },
    {
      '<leader>qD',
      function() require('trouble').toggle('workspace_diagnostics') end,
      desc = '[TROUBLE] Toggle WS Diagnostics',
    },
    {
      '<leader>qq',
      function() require('trouble').toggle('quickfix') end,
      desc = '[TROUBLE] Toggle Quickfix',
    },
    {
      '<leader>ql',
      function() require('trouble').toggle('loclist') end,
      desc = '[TROUBLE] Toggle Loclist',
    },
    {
      '<leader>qr',
      function() require('trouble').toggle('lsp_references') end,
      desc = '[TROUBLE] Toggle LSP References',
    },
  },
}
