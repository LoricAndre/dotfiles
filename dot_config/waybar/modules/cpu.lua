local M = {}

M.setup = function(settings)
  local sep = require("modules").sep(settings)

  return require("modules").mkspec(settings, {
    ["format"] = (" {usage}%"):gsub(" ", sep)
  })
end

return M
