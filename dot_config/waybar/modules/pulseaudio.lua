local M = {}

M.setup = function(settings)
  local sep = require("modules").sep(settings)

  return require("modules").mkspec(settings, {
    ["format"] = ("{icon} {volume}%  {format_source}"):gsub(" ", sep),
    ["format-bluetooth"] = ("{icon} {volume}%  {format_source}"):gsub(" ", sep),
    ["format-bluetooth-muted"] = ("󰝟 {icon}  {format_source}"):gsub(" ", sep),
    ["format-muted"] = ("󰝟  {format_source}"):gsub(" ", sep),
    ["format-source"] = (" {volume}%"):gsub(" ", sep),
    ["format-source-muted"] = "",
    ["format-icons"] = {
      ["headphone"] = "",
      ["hands-free"] = "󰋎",
      ["headset"] = "󰋎",
      ["phone"] = "",
      ["portable"] = "",
      ["car"] = "",
      ["default"] = {
        "",
        "",
        ""
      }
    },
    ["on-click"] = "pavucontrol"
  })
end

return M
