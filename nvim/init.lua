-- vim.g.mapleader = " "

require'impatient'
-- require'variables'
-- require'options'
-- require'mappings'
-- require'plugins'

local vim = vim
local yaml = require'lyaml'
local u = require'utils'

local file = io.open(vim.fn.expand(vim.fn.stdpath('config') .. '/config.yaml'), 'r')
local config = {}
if file then
  config = yaml.load(file:read('*all'))
  file:close()
end

u.let(config.globals)
u.set(config.options)
u.map(config.mappings)
u.packer(config.plugins)
u.colorscheme(config.colorscheme)
