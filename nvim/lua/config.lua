local yaml = require'lyaml'

local file = io.open('./config.yaml', 'r')
local config = {}
if file then
  config = yaml.load(file:read('*all'))
  file:close()
end

return config
