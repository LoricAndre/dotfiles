local vim = vim

vim.api.nvim_create_autocmd('ExitPre', {
  pattern = '*',
  callback = function()
    vim.api.nvim_command('Minimap close')
  end}
)

require'persistence'.setup {
  dir = vim.fn.expand(vim.fn.stdpath('data') .. '/sessions/')
}
