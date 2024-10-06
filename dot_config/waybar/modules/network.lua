local M = {}

M.setup = function(settings)
  local sep = require("modules").sep(settings)

  return require("modules").mkspec(settings, {
    ["format-wifi"] = ("󰤥 {signalStrength}%"):gsub(" ", sep),
    ["format-ethernet"] = ("󰈁"):gsub(" ", sep),
    ["tooltip-format"] = "{ifname}, {ipaddr}/{cidr} via {gwaddr} on {essid}",
    ["format-linked"] = ("󰈂 {ifname}"):gsub(" ", sep),
    ["format-disconnected"] = ("⚠"):gsub(" ", sep),
    ["format-alt"] = ""
  })
end

return M
