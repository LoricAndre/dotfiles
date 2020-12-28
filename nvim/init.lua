vim.g.mapleader = " "

vim.cmd("filetype plugin indent on")
require'pack'
require'options'
require'mappings'
vim.cmd("source ~/.config/nvim/misc.vim")
