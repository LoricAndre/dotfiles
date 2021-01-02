local vim = vim -- Just so LSP will shut up
require'utils'

vim.o.inccommand = "split"
vim.o.autoindent = true
vim.o.path = vim.o.path .. "**"
vim.o.swapfile = false
vim.o.scrolloff = 3
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.smartindent = true
vim.o.clipboard = "unnamedplus"
vim.o.hidden = true
vim.o.wildignore = vim.o.wildignore .. "*/node_modules,Session.vim,tags,.git"
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.wrap = true
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 300
vim.o.autowrite = true
vim.o.mouse = "a"
vim.o.wildoptions = ""
vim.g.loaded_netrw = 1
-- Colorscheme
vim.cmd('colorscheme disco')
vim.cmd('hi LineNr ctermbg=NONE ctermfg=NONE')
-- Statusline
local statusline = [[
%#DiffAdd#%{(mode()=~?'n.*')?'N':''}
%#DiffChange#%{(mode()=~?'i.*')?'I':''}
%#DiffDelete#%{(mode()=~?'r.*')?'R':''}
%#Cursor#%{(mode()=~?'v.*')?'V':''}
%#CursorIM#
 %R
%#Cursor#
%m
%#CursorLine# 
%f
 %=
%#CursorLine#
 %{WebDevIconsGetFileTypeSymbol()}
%#CursorIM#
 %3l:%-2c
%#Cursor#
 %3p%%
]]

vim.o.statusline = statusline:gsub('\n', '')
