return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      cs = { 'astyle' },
      python = { 'autopep8' },
      lua = { 'stylua' },
    },
  },
  keys = {
    {
      'gf',
      function() return require('conform').format({ async = true }) end,
      desc = '[LSP] Format',
    },
    {
      'gf',
      function() return require('conform').format({ async = true }) end,
      mode = 'v',
      desc = '[LSP] Format',
    },
  },
}
