local map = require'utils'.map
local sr = require'sniprun'

map {
  n = {
    {'<Esc>', '<CMD>noh | SnipClose<CR>'},
    {'<leader>r', sr.run}
  },
  v = {
    {'<leader>r', sr.run}
  }
}
