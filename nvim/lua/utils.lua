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

M.colorscheme = function(colorscheme)
  vim.api.nvim_command('colorscheme ' .. colorscheme)
end

M.set = function(options)
  for opt, val in pairs(options) do
    if type(val) ~= 'table' then
      vim.api.nvim_set_option(opt, val)
    else
      if val.lua ~= nil then
        vim.api.nvim_set_option(opt, loadstring('return ' .. val.lua)())
      else
        vim.api.nvim_set_option(opt, val)
      end
    end
  end
end

M.packer = function(plugins)
  local packer = require'packer'
  packer.reset()
  packer.init()
  for name, desc in pairs(plugins) do
    local plugin = desc
    if type(plugin) == 'string' then
      plugin = {plugin}
    end
    if type(name) == 'string' then
      plugin.as = name
    end
    if plugin.enabled ~= false then
      if plugin._ ~= nil then
        plugin[1] = plugin._
      end
      plugin.disable = not plugin.enabled
      if table.getn(vim.api.nvim_get_runtime_file("*/plugins/" .. name ..".lua", true)) > 0 then
        require('plugins.' .. name)
      end
      packer.use(plugin)
    end
  end
end

M.let = function(variables)
  for name, value in pairs(variables) do
    if type(value) ~= 'table' then
      vim.api.nvim_set_var(name, value)
    else
      if value.lua ~= nil then
        vim.api.nvim_set_var(name, loadstring('return ' .. value.lua)())
      else
        vim.api.nvim_set_var(name, value)
      end
    end
  end
end

return M
