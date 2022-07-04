local nmap = require 'utils'.nmap
local telescope = require 'telescope'
local builtin = require 'telescope.builtin'

nmap { '<leader>f', builtin.find_files }
nmap { '<leader>F', telescope.extensions.file_browser.file_browser }
nmap { '<leader>a', builtin.live_grep }
nmap { '<leader>b', builtin.buffers }
nmap { '<leader>y', builtin.registers }
nmap { '<F1>', builtin.help_tags }

telescope.load_extension('lsp_handlers')
telescope.load_extension('media_files')
telescope.load_extension('file_browser')
