local vim = vim
local M = {}

M.map = function(mappings)
  for mode, map in pairs(mappings) do
    for _, m in ipairs(map) do
      local opts = m[3] or {}
      opts.noremap = true
      opts.silent = true
      local rhs = m[2]
      if type(rhs) == 'function' then
        opts.callback = rhs
        rhs = '<Nop>'
      end
      vim.api.nvim_set_keymap(mode, m[1], rhs, opts)
    end
  end
end

M.colorscheme = function(colorscheme)
  vim.api.nvim_command('colorscheme ' .. colorscheme)
end

M.set = function(options)
  for opt, val in ipairs(options) do
    vim.api.nvim_set_option(opt, val)
  end
end

return M
