local vim = vim
local yaml = require'lyaml'
local M = {}

local function getKeys(t)
  local keys = {}
  for k, _ in pairs(t) do
    table.insert(keys, k)
  end
  return keys
end

local function isLua(t)
  local keys = getKeys(t)
  if #keys == 1 and keys[1] == 'lua' then
    return true
  end
  return false
end

local function eval(obj)
  for key, value in pairs(obj or {}) do
    if type(value) == 'table' then
      if isLua(value) then
          obj[key] = loadstring('return ' .. value.lua)()
      else
        obj[key] = eval(value)
      end
    end
  end
  return obj or {}
end


M.load = function(filename)
  local file = io.open(vim.fn.expand(vim.fn.stdpath('config') .. '/' .. filename), 'r')
  local config = {}
  if file then
    config = yaml.load(file:read('*all'))
    file:close()
  else
    print('Could not load config file: ' .. filename)
  end
  return config
end

M.merge = function(t1, t2)
  for k, v in pairs(t2) do
      if (type(v) == "table") and (type(t1[k] or false) == "table") then
          t1[k] = M.merge(t1[k], t2[k])
      else
          t1[k] = v
      end
  end
  return t1
end

M.getConfig = function(filename)
  local config = M.load(filename)
  for _, filename in ipairs(config.includes or {}) do
    local file = M.load(filename)
    config = M.merge(config, file)
  end
  return config
end

local function source(filename)
  if filename then
    return require(filename)
  end
end

M.packer = function(plugins)
  local packer = require'packer'
  packer.reset()
  packer.init()
  for name, desc in pairs(plugins or {}) do
    local plugin = desc
    if type(plugin) == 'string' then
      plugin = {plugin}
    end
    if type(name) == 'string' then
      plugin.as = name
    end
    if plugin.enabled ~= false then
      plugin[1] = plugin._ or plugin[1]
      M.let(plugin.globals or {})
      M.set(plugin.options or {})
      M.map(plugin.mappings or {})
      loadstring(plugin.config or "")()
      M.aug("plugins." .. name, plugin.autocmds)
      for req, opts in pairs(plugin.setup or {}) do
        require(req).setup(eval(opts))
      end
      for plug, opts in pairs(plugin.requires or {}) do
        if type(opts) == 'table' then
          opts[1] = opts._ or opts[1]
        end
        plugin.requires[plug] = opts
      end
      packer.use(plugin)
    end
  end
end

M.colorscheme = function(colorscheme)
  vim.api.nvim_command('colorscheme ' .. colorscheme)
end

M.set = function(options)
  for opt, val in pairs(eval(options)) do
    vim.api.nvim_set_option(opt, val)
  end
end

M.let = function(variables)
  for name, value in pairs(eval(variables)) do
    vim.api.nvim_set_var(name, value)
  end
end

M.map = function(mappings)
  for mode, map in pairs(mappings or {}) do
    for _, m in ipairs(map) do
      local opts = m[3] or {}
      opts.noremap = true
      opts.silent = true
      local lhs = m[1]
      local rhs = m[2]
      if type(rhs) == 'table' then
        opts.callback = rhs.callback
        rhs = rhs.callback
      elseif type(rhs) == 'function' then
        opts.callback = rhs
        rhs = '<Nop>'
      end
      if opts.buffer then
	opts.buffer = nil
	vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
      else
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
      end
    end
  end
end

M.aug = function(name, list)
  if list then
    vim.cmd('aug ' .. name .. '\nau!\nau '  ..
       table.concat(list, '\nau ') .. '\naug END')
  end
end

return M
