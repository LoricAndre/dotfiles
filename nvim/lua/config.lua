local vim = vim
local yaml = require'lyaml'

local file = io.open(vim.fn.expand(vim.fn.stdpath('config') .. '/config.yaml'), 'r')
local config = {}
if file then
  config = yaml.load(file:read('*all'))
  file:close()
end

return config
