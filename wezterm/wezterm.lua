local w = require'wezterm'
local c = {}


c.font = w.font("{{font}}")
c.font_size = {{font_size}}
c.colors = {
  foreground = "#{{color.fg}}",
  background = "#{{color.bg}}",
  ansi = {
    "#{{color.0}}",
    "#{{color.1}}",
    "#{{color.2}}",
    "#{{color.3}}",
    "#{{color.4}}",
    "#{{color.5}}",
    "#{{color.6}}",
    "#{{color.7}}",
  },
  brights = {
    "#{{color.8}}",
    "#{{color.9}}",
    "#{{color.10}}",
    "#{{color.11}}",
    "#{{color.12}}",
    "#{{color.13}}",
    "#{{color.14}}",
    "#{{color.15}}",
  },
  cursor_bg = "#{{color.fg}}",
  cursor_fg = "#{{color.bg}}",
  cursor_border = "#{{color.bg}}",
  selection_fg = "#{{color.bg}}",
  selection_bg = "#{{color.fg}}",
}
c.window_background_opacity = 0.9
c.hide_tab_bar_if_only_one_tab = true
c.tab_bar_at_bottom = true
c.use_fancy_tab_bar = false
c.enable_wayland = true
c.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }

c.keys = {
  {key="t", mods="ALT", action=w.action{SpawnTab="CurrentPaneDomain"}},
  {key="q", mods="ALT", action=w.action{CloseCurrentTab={confirm=true}}},
  {key="w", mods="ALT", action=w.action{CloseCurrentTab={confirm=true}}},
  {key="Tab", mods="ALT", action=w.action{ActivateTabRelative=-1}},
  {key="Tab", mods="ALT", action=w.action{ActivateTabRelative=1}},
  {key="V", mods="CTRL|SHIFT", action=w.action{PasteFrom="Clipboard"}},
  {key="C", mods="CTRL|SHIFT", action=w.action{CopyTo="Clipboard"}},
}

local nkeys = {
  "&",
  "é",
  "\"",
  "'",
  "(",
  "-",
  "è",
  "_",
  "ç",
  "à"
}
for i, k in ipairs(nkeys) do
  table.insert(c.keys, {
    key = k,
    mods = "ALT",
    action = w.action{ActivateTab=i-1}
  })
end

return c
