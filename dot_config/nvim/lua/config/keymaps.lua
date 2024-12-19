vim.keymap.set({ 'n', 'x', 'v', 'o' }, '<leader><Space>', '<CMD>b#<CR>')
vim.keymap.set({ 'n', 'x', 'v', 'o', 'i' }, '<F1>', '<nop>')

vim.keymap.set('n', '<C-t>', function()
  pcall(Snacks.terminal.toggle, nil)
end, { desc = 'Open terminal' })

-- local function is_qf_open()
--   for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
--     if vim.fn.buflisted(bufnr) == 1 then
--       if vim.api.nvim_get_option_value('ft', { buf = bufnr }) == 'qf' then
--         return true
--       end
--     end
--   end
--   return false
-- end
--
-- vim.keymap.set('n', '<leader>c', function()
--   if is_qf_open() then
--     vim.cmd.cclose()
--   else
--     vim.cmd.copen()
--   end
-- end, { desc = 'toggle qf' })
