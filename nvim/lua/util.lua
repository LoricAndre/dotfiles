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
    if c.name ~= 'GitHub Copilot' then
      if not res then
        res = prefix
      else
        res = res .. sep
      end
      res = res .. c.name
    end
  end
  return res
end

M.sidebar = {}

---Close all windows with filetype in g:sidebar_filetypes
---Then run the cmd to open a new one
---@param cmd string the command to run to open the current buffer
function M.sidebar.open(cmd)
  local ftlist = vim.g.sidebar_filetypes or {}
  local window_ids = vim.api.nvim_list_wins()
  for _, win in ipairs(window_ids) do
    local bufnr = vim.api.nvim_win_get_buf(win)
    if vim.tbl_contains(ftlist, vim.bo[bufnr].ft) then
      vim.api.nvim_win_close(win, false)
    end
  end
  vim.cmd(cmd)
end

---Register the filetype to the sidebar
---@param ft string
function M.sidebar.register_ft(ft)
  local fts = vim.g.sidebar_filetypes or {}
  vim.g.sidebar_filetypes = vim.list_extend(fts, { ft })
end

return M
