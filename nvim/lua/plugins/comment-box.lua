local maps = require'nest'.applyKeymaps
local m = require'mappings.constants'
local cbox = require'comment-box'

maps {
  {mode = 'n', {
    {m.g .. m.C, cbox.cbox}
  }}
}
