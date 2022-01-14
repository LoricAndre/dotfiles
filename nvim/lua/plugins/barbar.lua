local maps = require'nest'.applyKeymaps
local m = require'mappings.constants'

maps {
  {mode = 'n', {
    {'<Tab>', '<CMD>BufferNext<CR>'},
    {'<S-Tab>', '<CMD>BufferPrevious<CR>'},
  }}
}
