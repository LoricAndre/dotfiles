local M = {}

local function dispatch(...)
  return 'swaync-client ' .. table.concat({ ... }, ' ')
end

M.setup = function(settings)
  local sep = require('modules').sep(settings)

  return require('modules').mkspec(settings, {
    ['format'] = '{icon}',
    ['tooltip'] = '',
    ['return-type'] = 'json',
    ['format-icons'] = {
      ['notification'] = '<sup></sup>',
      ['none'] = '',
      ['dnd-notification'] = '<sup></sup>',
      ['dnd-none'] = '',
      ['inhibited-notification'] = '<sup></sup>',
      ['inhibited-none'] = '',
      ['dnd-inhibited-notification'] = '<sup></sup>',
      ['dnd-inhibited-none'] = '',
    },
    ['on-click'] = dispatch('-t -sw'),
    ['on-click-right'] = dispatch('-d -sw'),
    ['exec-if'] = dispatch('-v'),
    ['exec'] = dispatch('-swb'),
  })
end

return M
