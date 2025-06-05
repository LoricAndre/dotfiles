require('util').lazy_on_evt('InsertEnter', 'autopairs', function()
  vim.cmd.packadd('nvim-autopairs')
  require('nvim-autopairs').setup({})
end)
