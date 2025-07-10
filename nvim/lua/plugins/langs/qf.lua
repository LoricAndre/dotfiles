vim.api.nvim_create_autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.keymap.set('n', 'q', '<CMD>cclose<CR>', { buffer = true, desc = 'close qflist' })
  end
})
return {}
