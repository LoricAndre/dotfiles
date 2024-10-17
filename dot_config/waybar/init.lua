local utils = require("utils")

local cfg = {
  settings = require('settings'),
  widgets = {
    left = { 'hyprland/workspaces' },
    center = {},
    right = {
      'pulseaudio',
      'network',
      'cpu',
      'memory',
      'disk',
      'battery',
      'clock',
      'tray',
      'custom/swaync',
    },
  },
}

print(utils.build(cfg))
