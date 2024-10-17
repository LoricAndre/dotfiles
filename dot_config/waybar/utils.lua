local json = require('json')

local M = {}

M.vertical = function(settings)
  return settings.position == "left" or settings.position == "right"
end

function M.build(spec)
  local built = spec.settings
  for _, pos in ipairs({ 'left', 'right', 'center' }) do
    built['modules-' .. pos] = spec.widgets[pos]
    for _, module in ipairs(spec.widgets[pos]) do
      built[module] =
          require('modules.' .. module:gsub('/', '.')).setup(spec.settings)
    end
  end

  local encoded = json.encode(built)

  return encoded
end

return M
