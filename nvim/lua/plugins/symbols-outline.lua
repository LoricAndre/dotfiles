local maps = require'nest'.applyKeymaps
local m = require'mappings.constants'

maps {
  {mode = 'n', {
    {m.o, {
      {m.s, "<CMD>SymbolsOutline<CR>"}
    }}
  }}
}

