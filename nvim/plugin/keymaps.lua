-- vim.keymap.set({ 'n', 'x', 'i', 'v', 's', 't' }, '<M-l>', '<C-\\><C-n><C-w><C-l>')
-- vim.keymap.set({ 'n', 'x', 'i', 'v', 's', 't' }, '<M-k>', '<C-\\><C-n><C-w><C-k>')
-- vim.keymap.set({ 'n', 'x', 'i', 'v', 's', 't' }, '<M-j>', '<C-\\><C-n><C-w><C-j>')
-- vim.keymap.set({ 'n', 'x', 'i', 'v', 's', 't' }, '<M-h>', '<C-\\><C-n><C-w><C-h>')

vim.keymap.set('n', '<leader><space>', '<CMD>b#<CR>')

-- vim.keymap.set('t', 'hj', '<C-\\><C-n>')

vim.keymap.set('n', '<Esc>', '<CMD>noh<CR><Esc>')

vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

vim.keymap.set('n', '(', '[')
vim.keymap.set('n', ')', ']')
