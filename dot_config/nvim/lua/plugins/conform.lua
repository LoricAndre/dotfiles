return {
  {
    'zapling/mason-conform.nvim',
    after = {'mason.nvim', 'conform.nvim'},
    opts = {},
    event = 'LspAttach'
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        cs = { 'astyle' },
        python = { 'autopep8', 'ruff' },
        lua = { 'stylua' },
        typescript = { 'prettierd' },
        javascript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        rust = { 'rustfmt' }
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
  },
}
