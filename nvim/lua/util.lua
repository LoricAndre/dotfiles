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

function M.bdel()
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_win_get_buf(0)

  local function bdel(b)
    vim.api.nvim_buf_delete(b, {})
  end

  local alt = vim.fn.bufnr('#')
  if alt ~= buf and vim.fn.buflisted(alt) == 1 then
    vim.api.nvim_win_set_buf(win, alt)
    -- this will enter if unable to use the previous buffer
  elseif not pcall(vim.cmd, 'bprevious') and buf ~= vim.api.nvim_win_get_buf(win) then
    local new_buf = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_win_set_buf(win, new_buf)
  end

  bdel(buf)
end

return M
