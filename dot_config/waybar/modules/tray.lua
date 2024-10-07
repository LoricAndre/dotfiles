local M = {}

M.setup = function(settings)
  local sep = require("modules").sep(settings)

  return require("modules").mkspec(settings, {
    spacing = 10
  })
end

return M
