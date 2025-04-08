local M = {}

---Get the attached lsp clients as a string
---@param bufnr integer
---@param sep string
---@param prefix string
---@return string
function M.lsp_clients_str(bufnr, sep, prefix)
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
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

return M
