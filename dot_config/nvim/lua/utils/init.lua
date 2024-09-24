local M = {}

M.feedkeys = function(keys)
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(keys, true, false, true),
    'n',
    true
  )
end

M.pumvisible = function() return tonumber(vim.fn.pumvisible()) ~= 0 end

M.has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api
        .nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match('%s')
      == nil
end

M.file_at_root = function(path) return vim.fn.glob(path) end

M.has_plugin = function(plugin)
  local has_p, _ = pcall(require, plugin)
  return has_p
end

return M
