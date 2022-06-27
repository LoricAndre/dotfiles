local nmap = require 'utils'.nmap
local vmap = require 'utils'.vmap
local tmap = require 'utils'.tmap

nmap { '<Tab>', '<CMD>bn<CR>' }
nmap { '<S-Tab>', '<CMD>bp<CR>' }
nmap {'<leader>n', '<CMD>cnext<CR>'}
nmap {'<leader>p', '<CMD>cprev<CR>'}
nmap { 'm', 'l' }
nmap { 'l', 'k' }
nmap { 'k', 'j' }
nmap { 'j', 'h' }
nmap { '<M-m>', '<C-w><C-l>' }
nmap { '<M-l>', '<C-w><C-k>' }
nmap { '<M-k>', '<C-w><C-j>' }
nmap { '<M-j>', '<C-w><C-h>' }
nmap { '<Esc>', '<CMD>noh<CR>' }
nmap { '<leader><Space>', '<CMD>b#<CR>' }
nmap { '<leader>Q', '<CMD>q<CR>' }
nmap { '<leader>q', '<CMD>bd<CR>' }
nmap { '<leader>R', '<CMD>so $MYVIMRC<CR>' }
nmap { '<leader>P', '<CMD>so $MYVIMRC <BAR> PackerSync<CR>' }
vmap { 'm', 'l' }
vmap { 'l', 'k' }
vmap { 'k', 'j' }
vmap { 'j', 'h' }
vmap { '<', '<gv' }
vmap { '>', '>gv' }
tmap { '<C-Esc>', '<C-\\><C-n>:q<CR>' }
tmap { 'jk', '<C-\\><C-n>' }
tmap { '<M-m>', '<C-\\><C-n><C-w><C-l>' }
tmap { '<M-l>', '<C-\\><C-n><C-w><C-k>' }
tmap { '<M-k>', '<C-\\><C-n><C-w><C-j>' }
tmap { '<M-j>', '<C-\\><C-n><C-w><C-h>' }
