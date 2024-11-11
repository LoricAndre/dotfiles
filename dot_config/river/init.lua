local r = require('river')
local C = require('constants')

require('options').setup({
  ['keyboard-layout'] = '-options \'caps:escape\' fr',
  ['input \'*Touchpad*\''] = {
    ['click-method'] = 'clickfinger',
    tap = 'enabled',
    ['natural-scroll'] = 'enabled',
  },
  ['focus-follows-cursor'] = 'normal',
  ['attach-mode'] = 'bottom',
  ['set-cursor-warp'] = 'on-output-change',
  ['default-layout'] = C.layout,
  ['spawn-tagmask'] = {
    r.tagmask(32) - 1 & r.tagmask(C.scratch_tag),
    r.tagmask(32) - 1 & r.tagmask(C.sticky_tag),
  },
  ['set-repeat'] = '50 300',
})

require('rules').setup({
  { app_id = '*', action = 'ssd' },
})

require('maps').setup({
  normal = {
    Super = {
      Return = r.spawn(C.term),
      B = r.spawn(C.browser),
      D = r.spawn(C.runner),
      Q = 'close',
      Left = r.focus_output('left'),
      F = 'toggle-float',
      F11 = 'toggle-fullscreen',
      Space = 'toggle-focused-tags ' .. r.tagmask(C.scratch_tag),
      S = 'toggle-view-tags ' .. r.tagmask(C.sticky_tag),
      Print = 'spawn \'grimblast copysave area "$HOME/pictures/screenshots/$(date +%F_%R:%S.png)"\'',
      Z = r.send_layout_cmd('main-location-cycle', 'left,monocle'),
    },
    ['Super+Shift'] = {
      E = 'exit',
      R = r.reload(),
      Space = 'set-view-tags ' .. r.tagmask(C.scratch_tag),
    },
    ['Super+Control'] = {
      J = r.send_layout_cmd('main-ratio', '-0.05'),
      M = r.send_layout_cmd('main-ratio', '+0.05'),
      K = r.send_layout_cmd('main-count', '-1'),
      L = r.send_layout_cmd('main-count', '+1'),
    },
    ['Super+Alt'] = {},
    ['Control+Alt'] = {
      L = r.spawn(C.lock),
    },
  },
})

require('maps').setup_dirs({
  Super = r.focus_view,
  ['Super+Shift'] = r.swap_view,
  ['Super+Alt'] = r.move_float,
  ['Super+Control+Alt'] = r.snap,
  ['Super+Shift+Alt'] = r.resize,
})
require('maps').setup_arrows({
  Super = r.focus_output,
  ['Super+Shift'] = r.send_to_output,
})
require('maps').setup_pointers({
  Super = {
    BTN_LEFT = 'move-view',
    BTN_RIGHT = 'resize-view',
    BTN_MIDDLE = 'toggle-float',
  },
})

require('maps').setup_tags({
  Super = r.set_focused_tags,
  ['Super+Shift'] = r.set_view_tags,
  ['Super+Control'] = r.toggle_focused_tags,
  ['Super+Control+Shift'] = r.toggle_view_tags,
})

for _, mode in ipairs({ 'normal', 'locked' }) do
  r.dispatch(
    'map',
    mode,
    'None',
    'XF86AudioRaiseVolume',
    r.spawn('pamixer', '-i', 5)
  )
  r.dispatch(
    'map',
    mode,
    'None',
    'XF86AudioLowerVolume',
    r.spawn('pamixer', '-d', 5)
  )
  r.dispatch(
    'map',
    mode,
    'None',
    'XF86AudioMute',
    r.spawn('pamixer', '--togle-mute')
  )
  r.dispatch(
    'map',
    mode,
    'None',
    'XF86AudioMedia',
    r.spawn('playerctl', 'play-pause')
  )
  r.dispatch(
    'map',
    mode,
    'None',
    'XF86AudioPlay',
    r.spawn('playerctl', 'play-pause')
  )
  r.dispatch(
    'map',
    mode,
    'None',
    'XF86AudioPrev',
    r.spawn('playerctl', 'previous')
  )
  r.dispatch('map', mode, 'None', 'XF86AudioNext', r.spawn('playerctl', 'next'))
  r.dispatch(
    'map',
    mode,
    'None',
    'XF86MonBrightnessUp',
    r.spawn('brightnessctl', 'set', '+5%')
  )
  r.dispatch(
    'map',
    mode,
    'None',
    'XF86MonBrightnessDown',
    r.spawn('brightnessctl', 'set', '5%-')
  )
end

require('autostart').setup({
  'waybar',
  'udiskie',
  'pacwall',
  'kanshi',
  'nm-applet',
  {
    {
      C.layout,
      '-no-smart-gaps',
      '-inner-gaps',
      10,
      '-outer-gaps',
      20,
      '-main-ratio',
      0.65,
    },
    restart = false,
  },
})
