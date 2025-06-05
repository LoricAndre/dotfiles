return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { '<leader>c', group = 'lsp' },
      { '<leader>a', group = 'llm' },
      { '<leader>g', group = 'git' },
      { '<leader>m', group = 'mcs' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = '[whk] show keymaps',
    },
  },
}
