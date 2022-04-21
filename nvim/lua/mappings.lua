local map = require'utils'.map
local config = require'config'

local default = {
  n = {
    {'m', 'l'},
    {'l', 'k'},
    {'k', 'j'},
    {'j', 'h'},
    {'<M-m>', '<C-w><C-l>'},
    {'<M-l>', '<C-w><C-k>'},
    {'<M-k>', '<C-w><C-j>'},
    {'<M-j>', '<C-w><C-h>'},
    {'<Esc>', '<CMD>noh<CR>'},
    {'<leader><Space>', '<CMD>b#<CR>'},
    {'<leader>Q', '<CMD>q<CR>'},
    {'<leader>q', '<CMD>bd<CR>'}
  },
  v = {
    {'m', 'l'},
    {'l', 'k'},
    {'k', 'j'},
    {'j', 'h'},
    {'<', '<gv'},
    {'>', '>gv'},
  }
}

map(default)
map(config.mappings)
