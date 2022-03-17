local maps = require'nest'.applyKeymaps
local m = require'mappings.constants'

maps {
  {mode = 'n', {
    {m.o, {
      {m.a, "<CMD>AerialToggle!<CR>"}
    }}
  }}
}

require'aerial'.setup {}
