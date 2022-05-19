local nmap = require 'utils'.nmap

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })

function _lazygit_toggle()
  lazygit:toggle()
end

nmap { '<leader>t', function() require 'toggleterm'.toggle(0) end }
nmap { '<leader>g', _lazygit_toggle }

return require 'toggleterm'.setup {
  direction = 'horizontal'
}
