vim.opt.langmap = 'jh,kj,lk,ml,hm'
vim.opt.laststatus = 3

vim.g.snacks_animate = false

-- Neovide
if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.75
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_cursor_animation_length = 0.001
  vim.g.neovide_scroll_animation_length = 0.001
end

-- Windows
if vim.fn.has('win32') == 1 then
  vim.opt.shell = 'powershell'
  vim.opt.shellcmdflag = '-command'
  vim.opt.shellquote = '"'
  vim.opt.shellxquote = ''
end
