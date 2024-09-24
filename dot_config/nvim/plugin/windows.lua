if vim.fn.has('win32') == 1 then
  vim.opt.shell = 'powershell'
  vim.opt.shellcmdflag = '-command'
  vim.opt.shellquote = '"'
  vim.opt.shellxquote = ''
end
