local wt = require'wezterm'

local config = {}
local colors = {}
local ansi = {}
local brights = {}

config.font = wt.font("mononoki Nerd Font Mono")

colors.foreground = "%{{foreground}}"
colors.background = "%{{background}}"
colors.cursor_background = "%{{background}}"
colors.cursor_foreground = "%{{cursor}}"
colors.cursor_border = "%{{cursor}}"
colors.selection_bg = "%{{foreground}}"
colors.selection_fg = "%{{background}}"
colors.scrollbar_thumb = "%{{cursor}}"
colors.split = "%{{cursor}}"
ansi[1] = "%{{color0}}"
ansi[2] = "%{{color1}}"
ansi[3] = "%{{color2}}"
ansi[4] = "%{{color3}}"
ansi[5] = "%{{color4}}"
ansi[6] = "%{{color5}}"
ansi[7] = "%{{color6}}"
ansi[8] = "%{{color7}}"
brights[1] = "%{{color8}}"
brights[2] = "%{{color9}}"
brights[3] = "%{{color10}}"
brights[4] = "%{{color11}}"
brights[5] = "%{{color12}}"
brights[6] = "%{{color13}}"
brights[7] = "%{{color14}}"
brights[8] = "%{{color15}}"
colors.ansi = ansi
colors.brights = brights
config.colors = colors

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

return config
