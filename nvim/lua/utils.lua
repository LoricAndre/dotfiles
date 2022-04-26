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

M.packer = function(plugins)
  local packer = require'packer'
  local opts = {}
  packer.reset()
  packer.init()
  for name, desc in pairs(plugins) do
    if type(desc) == 'string' then
      table.insert(opts, desc)
    end
    if type(name) == 'string' then
      local plugin = desc
      if type(plugin) == 'string' then
        plugin = {plugin}
      end
      if plugin.enabled ~= false then
        plugin.as = name
        plugin.disable = not plugin.enabled
        if table.getn(vim.api.nvim_get_runtime_file("*/plugins/" .. name ..".lua", true)) > 0 then
          require('plugins.' .. name)
        end
        -- table.insert(opts, 1, plugin)
        packer.use(plugin)
      end
    end
  end
end

M.let = function(variables)
  for name, value in pairs(variables) do
    vim.api.nvim_set_var(name, value)
  end
end

return M
