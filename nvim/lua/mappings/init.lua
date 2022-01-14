local maps = require'nest'.applyKeymaps

maps {
  {mode = 'n', {
    {'m', 'l'},
    {'l', 'k'},
    {'k', 'j'},
    {'j', 'h'},
    {'<M-m>', '<C-w><C-l>'},
    {'<M-l>', '<C-w><C-k>'},
    {'<M-k>', '<C-w><C-j>'},
    {'<M-j>', '<C-w><C-h>'},
    {'<Esc>', '<CMD>noh<CR>'},
    {'<leader>', {
      {'<Space>', '<CMD>b#<CR>'},
      {'Q', '<CMD>q<CR>'},
      {'q', '<CMD>bw<CR>'}
    }}
  }},
  {mode = 'v', {
    {'m', 'l'},
    {'l', 'k'},
    {'k', 'j'},
    {'j', 'h'},
    {'<', '<gv'},
    {'>', '>gv'},
    {'<leader>', {
        {'<Space>', '<CMD>b#<CR>'}
    }}
  }},
  {mode = 't', {
    {'<C-d>', '<C-\\><C-n>'}
  }}
}
