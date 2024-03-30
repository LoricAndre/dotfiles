vim.keymap.set({"n", "v", "o"}, "j", "<Left>")
vim.keymap.set({"n", "v", "o"}, "k", "<Down>")
vim.keymap.set({"n", "v", "o"}, "l", "<Up>")
vim.keymap.set({"n", "v", "o"}, "m", "<Right>")


vim.keymap.set({"n", "v", "o", "t"}, "<M-j>", "<C-\\><C-n><C-w><C-h>")
vim.keymap.set({"n", "v", "o", "t"}, "<M-k>", "<C-\\><C-n><C-w><C-j>")
vim.keymap.set({"n", "v", "o", "t"}, "<M-l>", "<C-\\><C-n><C-w><C-k>")
vim.keymap.set({"n", "v", "o", "t"}, "<M-m>", "<C-\\><C-n><C-w><C-l>")
vim.keymap.set({"t"}, "jk", "<C-\\><C-n>")
vim.keymap.set({"v"}, "<", "<gv")
vim.keymap.set({"v"}, ">", ">gv")
vim.keymap.set({"n", "v", "o", "t"}, "<leader><Space>", "<CMD>b#<CR>")

vim.keymap.set("n", "<Esc>", "<CMD>noh<CR>")
vim.keymap.set("n", "<Tab>", "<CMD>bn<CR>")
vim.keymap.set("n", "<S-Tab>", "<CMD>bp<CR>")
