-- vim.keymap.set({ 'n', 'x', 'i', 'v', 's', 't' }, '<M-l>', '<C-\\><C-n><C-w><C-l>')
-- vim.keymap.set({ 'n', 'x', 'i', 'v', 's', 't' }, '<M-k>', '<C-\\><C-n><C-w><C-k>')
-- vim.keymap.set({ 'n', 'x', 'i', 'v', 's', 't' }, '<M-j>', '<C-\\><C-n><C-w><C-j>')
-- vim.keymap.set({ 'n', 'x', 'i', 'v', 's', 't' }, '<M-h>', '<C-\\><C-n><C-w><C-h>')

vim.keymap.set('n', '<leader><space>', '<CMD>b#<CR>')

-- vim.keymap.set('t', 'hj', '<C-\\><C-n>')

vim.keymap.set('n', '<Esc>', '<CMD>noh<CR><Esc>')

vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- vim.keymap.set('n', '(', '[', { noremap = false })
-- vim.keymap.set('n', ')', ']', { noremap = false })

vim.keymap.set('n', '<leader>q', function()
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
end, { desc = 'close buffer' })
