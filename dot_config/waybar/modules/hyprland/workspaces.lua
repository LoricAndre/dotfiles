local M = {}

local dispatch = function(...)
  return "hyprctl dispatch " .. table.concat({ ... }, " ")
end

M.setup = function(settings)
  local sep = require("modules").sep(settings)

  return require("modules").mkspec(settings, {
    ["all-outputs"] = false,
    ["on-scroll-up"] = dispatch("workspace", "e+1"),
    ["on-scroll-down"] = dispatch("workspace", "e-1"),
    format = "{icon}{name}" .. sep .. "{windows}",
    ["format-icons"] = {
      ["active"] = "",
      ["urgent"] = "!",
      ["default"] = ""
    },
    ["format-window-separator"] = sep,
    ["window-rewrite-default"] = "",
    ["window-rewrite"] = {
      ["class<Kitty>"] = "",
      ["class<Foot>"] = "",
      ["class<org.gnome.Nautilus>"] = "",
      ["title<(.* *)? nvim>"] = "",
      ["title<(.* *)?btm.*>"] = "",
      ["class<firefox>"] = "",
      ["class<zen-alpha>"] = "",
      ["class<librewolf>"] = "",
      ["class<firefox-nightly>"] = "",
      ["class<dev.zed.Zed-Preview>"] = "",
      ["title<(Open)?Lens.*>"] = "󱃾",
      ["class<mpv>"] = "",
      ["class<vlc>"] = "󰕼",
      ["class<obsidian>"] = "󱞁",
      ["class<Spotify>"] = "",
      ["class<com.hunterwittenborn.Celeste>"] = "󰴋",
      ["class<steam.*>"] = "󰓓",
      ["class<steam> title<Friends List>"] = "",
      ["class<steam_app_[0-9]+>"] = "󰮂",
      ["class<com.github.weclaw1.ImageRoll|nomacs>"] = "",
      ["class<discord>"] = "",
      ["title<Discord.*>"] = "",
      ["title<.[0-9]+. Discord.*>"] = " °",
      ["title<Signal>"] = "󰍡",
      ["title<WhatsApp.*>"] = "",
      ["title<.[0-9]+. WhatsApp.*>"] = "°",
      ["title<(.* - )?(.[0-9]+. )?YouTube.*>"] = "",
      ["title<.* - Gmail .*>"] = "󰊫",
      ["class<ONLYOFFICE Desktop Editors>"] = "󰈙",
      ["class<calibre-.*>"] = "",
      ["class<org.qbittorrent.qBittorrent>"] = "",
      ["class<org.kde.kdeconnect.*>"] = "",
      ["class<Gimp-.*>"] = "",
      ["title<Winetricks.*>"] = "󰡶",
      ["class<lutris>"] = "🦦",
      ["class<jetbrains-idea(-ce)?>"] = "",
      ["class<Code>"] = "󰨞",
      ["class<com.obsproject.Studio|zoom>"] = "",
      ["class<io.github.whoozle.android-file-transfer>"] = "",
      ["class<(Chromium)|(Chrome)>"] = ""
    }
  })
end

return M
