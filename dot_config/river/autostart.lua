local r = require('river')

local M = {}

local function pgrep(cmd)
  if type(cmd) == 'table' then
    cmd = cmd[1]
  end
  return os.execute('pgrep '.. cmd)[1]
end

local function pkill(cmd)
  if type(cmd) == 'table' then
    cmd = cmd[1]
  end
  os.execute('pkill ' .. cmd)
end

local function run(cmd)
  if type(cmd) == 'table' then
    cmd = table.concat(cmd, ' ')
  end
  os.execute(cmd .. " &")
end

function M.setup(executables)
  for _, spec in ipairs(executables) do
    local cmd = spec
    local restart = true
    if type(spec) == 'table' then
      cmd = spec[1]
      restart = spec.restart or true
    end
    if not cmd then
      return
    end
    if restart then
      pcall(pkill, cmd)
      run(cmd)
    else
      if not pgrep(cmd) then
        run(cmd)
      end
    end
  end
end

return M
