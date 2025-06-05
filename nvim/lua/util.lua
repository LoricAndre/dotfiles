local M = {}

---Get the attached lsp clients as a string
---@param bufnr integer
---@param sep string
---@param prefix string
---@return string
function M.lsp_clients_str(bufnr, sep, prefix)
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  local has_devicons, devicons = pcall(require, 'nvim-web-devicons')
  if not prefix and has_devicons then
    prefix = devicons.get_icon(vim.api.nvim_buf_get_name(bufnr)) .. ' '
  end
  local res
  for _, c in ipairs(clients) do
    if not res then
      res = prefix
    else
      res = res .. sep
    end
    res = res .. c.name
  end
  return res
end

---@param a any lhs, rhs, mode = 'n', desc = 'desc'
function M.map(a)
  local lhs = a[1]
  local rhs = a[2]
  local mode = a.mode or 'n'
  local desc = a.desc or tostring(rhs)
  return vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

--- @param plugin string plugin name
--- @param cmds string[] commands to create
function M.lazy_cmds(plugin, cmds)
  for _, cmd in pairs(cmds) do
    vim.api.nvim_create_user_command(cmd, function(args)
      vim.cmd.packadd(plugin)
      local opts = {
        cmd = cmd,
        mods = args.smods,
        bang = args.bang,
        args = args.fargs,
      }
      if args.range == 1 then
        opts.range = { args.line1 }
      elseif args.range == 2 then
        opts.range = { args.line1, args.line2 }
      end
      if args.count > 0 then
        opts.count = args.count
      end
      if args.reg and args.reg ~= '' then
        opts.reg = args.reg
      end
      vim.cmd(opts)
    end, {})
  end
end

---@param evt string Event
---@param id string Plugin identifier
---@param cb function callback
function M.lazy_on_evt(evt, id, cb)
  vim.api.nvim_create_autocmd('InsertEnter', {
    group = vim.api.nvim_create_augroup('lazy_' .. evt .. '_' .. id, { clear = true }),
    once = true,
    callback = cb
  })
end

return M
