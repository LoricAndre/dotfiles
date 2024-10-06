local utils = require("utils")

local M = {}
M.sep = function(settings)
  if utils.vertical(settings) then
    return "\n"
  else
    return " "
  end
end

M.setup = function(settings)
  local spec = {
    justify = "center"
  }
  return spec
end

M.mkspec = function(settings, spec)
  local full_spec = M.setup(settings)
  for k, v in pairs(spec) do
    full_spec[k] = v
  end
  return full_spec
end

return M
