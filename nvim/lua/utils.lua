local vim = vim
local M = {}

M.map = function(mappings)
  for mode, map in pairs(mappings) do
    for _, m in ipairs(map) do
      local opts = m[3] or {}
      opts.noremap = true
      opts.silent = true
      local lhs = m[1]
      local rhs = m[2]
      if type(rhs) ~= 'string' then
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

M.colorscheme = function(colorscheme)
  vim.api.nvim_command('colorscheme ' .. colorscheme)
end

M.set = function(options)
  for opt, val in pairs(options) do
    vim.api.nvim_set_option(opt, val)
  end
end

local paq_make_url = function(item)
  if type(item) ~= 'string' then
    item = item[1]
  end
  local url = item
  local _, slashes = string.gsub(item, "/", "")
  if slashes == 1 then
    url = 'git@github.com:' .. item
  end
  return url
end

local paq_deps = function(config, deps)
  if deps then
    for _, a in ipairs(deps) do
      local item = {url = paq_make_url(a)}
      table.insert(config, item)
    end
  end
  return config
end

M.paq = function(plugins)
  local config = {}
  for name, desc in pairs(plugins) do
    config[name] = {}
    config[name].url = paq_make_url(desc)
    if type(desc) ~= 'string' then
      config = paq_deps(config, desc.requires)
    end
    if type(name) == 'string' then
      config[name].as = name
      if vim.api.nvim_get_runtime_file("*/plugins/" .. name ..".lua", true) ~= {} then
        if not pcall(function() require('plugins.' .. name) end) then
          print("Error while sourcing config for " .. name)
        end

      end
    end
  end
  return require'paq'(config)
end

M.packer = function(plugins)
  local packer = require'packer'
  for name, desc in pairs(plugins) do
    local plugin = desc
    if type(desc) == 'string' then
      plugin = {desc}
    end
    if type(name) == 'string' then
      plugin.as = name
      if vim.api.nvim_get_runtime_file("*/plugins/" .. name ..".lua", true) ~= {} then
        if not pcall(function() require('plugins.' .. name) end) then
          print("Error while sourcing config for " .. name)
        end
      end
    end
    packer.use(plugin)
  end
end

M.let = function(variables)
  for name, value in pairs(variables) do
    vim.api.nvim_set_var(name, value)
  end
end

return M
