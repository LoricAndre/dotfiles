local nmap = require 'utils'.nmap
local vmap = require 'utils'.vmap

nmap { '<leader>r', require 'sniprun'.run }
nmap { '<Esc>', '<CMD>noh<BAR>:SnipClose<CR>' }
vmap { '<leader>r', function() require 'sniprun'.run('v') end }
