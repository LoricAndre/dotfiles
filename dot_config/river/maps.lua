local r = require('river')
local C = require('constants')
local utils = require('utils')

local M = {}

function M.setup_pointers(pointer_maps)
  for mod, mod_maps in pairs(pointer_maps) do
    for lhs, rhs in pairs(mod_maps) do
      r.dispatch('map-pointer', 'normal', mod, lhs, rhs)
    end
  end
end

function M.setup_arrows(arrow_maps)
  for dir, _ in pairs(C.dirs) do
    for mod, fn in pairs(arrow_maps) do
      r.nmap(mod, utils.capitalize(dir), fn(dir))
    end
  end
end

function M.setup_dirs(dir_maps)
  for dir, key in pairs(C.dirs) do
    for mod, fn in pairs(dir_maps) do
      r.nmap(mod, key, fn(dir))
    end
  end
end

function M.setup_tags(tag_maps)
  for tag, key in ipairs(C.tag_keys) do
    for mod, fn in pairs(tag_maps) do
      r.nmap(mod, key, fn(tag))
    end
  end
end

function M.setup(maps)
  for mode, mode_maps in pairs(maps) do
    for mod, mod_maps in pairs(mode_maps) do
      for key, action in pairs(mod_maps) do
        r.dispatch("map", mode, mod, key, action)
      end
    end
  end
end

return M
