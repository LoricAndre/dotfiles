require'impatient'

local vim = vim
local u = require'utils'

config = u.getConfig('config.yaml')

u.let(config.globals)
u.set(config.options)
u.map(config.mappings)
u.aug("Init", config.autocmds)

u.packer(config.plugins)

u.colorscheme(config.colorscheme)
