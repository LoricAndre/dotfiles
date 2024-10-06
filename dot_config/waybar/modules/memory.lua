local M = {}

M.setup = function(settings)
  local sep = require("modules").sep(settings)

  return require("modules").mkspec(settings, {
    ["format"] = "" .. sep .. "{}%",
    ["tooltip-format"] = "memory: {used} / {total} GiB used\nswap: {swapUsed} / {swapTotal} GiB used",
  })
end

return M
