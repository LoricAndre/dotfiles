local M = {}
M.feedkeys = function(keys)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), 'n', true)
end

M.pumvisible = function()
  return tonumber(vim.fn.pumvisible()) ~= 0
end
M.has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
M.setup_completion_keymaps = function(bufnr)
  vim.keymap.set('i', '<CR>',
    function() return M.pumvisible() and '<C-y>' or '<CR>' end,
    { expr = true, buffer = bufnr })

  vim.keymap.set({ 'i', 's' }, '<Tab>',
    function()
      if M.pumvisible() then
        M.feedkeys '<C-n>'
      elseif vim.snippet.active { direction = 1 } then
        vim.snippet.jump(1)
      elseif M.has_words_before() then
        vim.lsp.completion.trigger()
      else
        M.feedkeys '<Tab>'
      end
    end,
    { expr = true, buffer = bufnr, noremap = false })
  vim.keymap.set({ 'i', 's' }, '<S-Tab>',
    function()
      if M.pumvisible() then
        M.feedkeys '<C-p>'
      elseif vim.snippet.active { direction = -1 } then
        vim.snippet.jump(-1)
      else
        M.feedkeys '<S-Tab>'
      end
    end,
    { expr = true, buffer = bufnr, noremap = false })
  vim.keymap.set('i', '<C-n>',
    function()
      if M.pumvisible() then
        M.feedkeys '<C-n>'
      else
        if next(vim.lsp.get_clients { bufnr = 0 }) then
          vim.lsp.completion.trigger()
        else
          if vim.bo.omnifunc == '' then
            M.feedkeys '<C-x><C-n>'
          else
            M.feedkeys '<C-x><C-o>'
          end
        end
      end
    end,
    { buffer = bufnr }
  )
  vim.keymap.set('s', '<BS>', '<C-o>s', { buffer = bufnr })
end

M.file_at_root = function(path)
  return vim.fn.glob(path)
end

return M
