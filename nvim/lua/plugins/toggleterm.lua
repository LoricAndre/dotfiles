local nmap = require 'utils'.nmap

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })
local floatTerm = Terminal:new({direction = 'float'})

function _lazygit_toggle()
  lazygit:toggle()
end

function _floatTerm_toggle()
  floatTerm:toggle()
end

nmap { '<leader>t', _floatTerm_toggle }
nmap { '<leader>th', function() require 'toggleterm'.toggle(0) end }
nmap { '<leader>tt', _floatTerm_toggle }
nmap { '<leader>g', _lazygit_toggle }

return require 'toggleterm'.setup {
  direction = 'horizontal'
}
