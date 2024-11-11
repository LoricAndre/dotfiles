local C = require('constants')

local M = {}
function M.dispatch(...) 
  local cmd = 'riverctl ' .. table.concat({ ... }, ' ')
  print("[dispatch] " .. cmd)
  os.execute(cmd)
end

function M.tagmask(number) return math.floor(2 ^ (number - 1)) end
function M.spawn(cmd) return 'spawn ' .. cmd end
function M.reload() return M.spawn('lua $HOME/.config/river/init') end
function M.focus_view(dir) return 'focus-view ' .. dir end
function M.swap_view(dir) return 'swap ' .. dir end
function M.focus_output(dir) return 'focus-output ' .. dir end
function M.send_to_output(dir) return 'send-to-output ' .. dir end
function M.send_layout_cmd(...)
  return 'send-layout-cmd ' .. C.layout .. ' "' .. table.concat({ ... }, ' ') .. '"'
end
function M.move_float(dir)
  local amount = 100
  return 'move ' .. dir .. ' ' .. amount
end
function M.snap(dir) return 'snap ' .. dir end
function M.resize(dir) return 'resize ' .. dir end
function M.nmap(mod, key, cmd) return M.dispatch('map', 'normal', mod, key, cmd) end

function M.set_focused_tags(tag) return 'set-focused-tags ' .. M.tagmask(tag) end
function M.set_view_tags(tag) return 'set-view-tags ' .. M.tagmask(tag) end
function M.toggle_focused_tags(tag)
  return 'toggle-focused-tags ' .. M.tagmask(tag)
end
function M.toggle_view_tags(tag) return 'toggle-view-tags ' .. M.tagmask(tag) end

return M
