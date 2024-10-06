local M = {}

M.setup = function(settings)
  local sep = require("modules").sep(settings)

  return require("modules").mkspec(settings, {
    ["interval"] = 30,
    ["format"] = (" {percentage_used}%"):gsub(" ", sep),
    ["path"] = "/"
  })
end

return M
