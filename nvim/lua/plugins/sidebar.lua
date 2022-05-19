local nmap = require 'utils'.nmap

nmap { '<leader>os', require 'sidebar-nvim'.toggle }
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = 'SidebarNvim*',
  callback = function()
    nmap { 'j', 'h', buffer = true }
    nmap { 'k', 'j', buffer = true }
    nmap { 'l', 'k', buffer = true }
    nmap { 'm', 'l', buffer = true }
    vim.wo.signcolumn = 'number'
  end
})

return require 'sidebar-nvim'.setup {
  buffers = {
    icon = '',
    ignored_buffers = {
      '.*oneterm.*',
      '.*toggleterm.*'
    },
  },
  hide_statusline = true,
  open = true,
  position = 'right',
  sections = {
    'buffers',
    'files',
    'symbols',
    'todos',
    'diagnostics'
  },
}
