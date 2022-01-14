local maps = require'nest'.applyKeymaps
local m = require'mappings.constants'
local sr = require'sniprun'

maps {
  {mode = 'n', {
    {'<Esc>', '<CMD>noh | SnipClose<CR>'},
    {'<leader>', {
      {m.r, sr.run}
    }}
  }},
  {mode = 'v', {
    {'<leader>', {
      {m.r, sr.run}
    }}
  }}
}
