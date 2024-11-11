local utils = require("utils")

local cfg = {
  settings = require('settings'),
  widgets = {
    left = { 'hyprland/workspaces', 'river/tags' },
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
