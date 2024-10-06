local M = {}

M.setup = function(settings)
  local sep = require("modules").sep(settings)

  return require("modules").mkspec(settings, {
    ["states"] = {
      -- "good": 95,
      ["warning"] = 30,
      ["critical"] = 15
    },
    ["format"] = "{icon}" .. sep .. "{capacity}%",
    ["format-full"] = "{icon}" .. sep .. "{capacity}%",
    ["format-charging"] = "󰂄" .. sep .. "{capacity}%",
    ["format-plugged"] = "" .. sep .. "{capacity}%",
    ["format-alt"] = "{icon} {time}",
    ["format-icons"] = {
      "󰁺",
      "󰁼",
      "󰁾",
      "󰂀",
      "󰂂"
    }
  })
end

return M
