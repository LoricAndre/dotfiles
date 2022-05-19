local M = {}

local map = function(mode, a)
  local lhs = a[1]
  local rhs= a[2]
  local opts = {
    noremap = true,
    silent = true
  }
  if a.noremap ~= nil then
    opts.noremap = a.noremap
  end
  if a.silent ~= nil then
    opts.silent = a.silent
  end
  if a.expr ~= nil then
    opts.expr = a.expr
  end
  if a.nowait ~= nil then
    opts.nowait = a.nowait
  end
  if type(rhs) == 'function' then
    opts.callback = rhs
    rhs = ''
  end
  if a.buffer then
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
  else
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
end

M.nmap = function(a)
  map('n', a)
end
M.tmap = function(a)
  map('t', a)
end
M.imap = function(a)
  map('i', a)
end
M.vmap = function(a)
  map('v', a)
end

return M
