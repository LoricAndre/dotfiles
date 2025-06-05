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

function M.map(a)
  local lhs = a[1]
  local rhs = a[2]
  local mode = a.mode or 'n'
  local desc = a.desc or tostring(rhs)
  return vim.keymap.set(mode, lhs, rhs, { desc = desc })
end

function M.lazy_cmds(plugin, cmds)
  for _, cmd in pairs(cmds) do
    vim.api.nvim_create_user_command(cmd, function(args) 
      vim.cmd.packadd(plugin)
      args.cmd = cmd
      vim.cmd(args)
    end, {})
  end
end

return M
