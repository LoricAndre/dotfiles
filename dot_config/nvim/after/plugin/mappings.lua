vim.keymap.set({ "n", "x", "v", "o" }, "j", "<Left>")
vim.keymap.set({ "n", "x", "v", "o" }, "k", "<Down>")
vim.keymap.set({ "n", "x", "v", "o" }, "l", "<Up>")
vim.keymap.set({ "n", "x", "v", "o" }, "m", "<Right>")

vim.keymap.set({ "n", "x", "v", "o" }, "(", "[")
vim.keymap.set({ "n", "x", "v", "o" }, ")", "]")

-- vim.keymap.set({"n", "v", "o", "t"}, "<M-j>", "<C-\\><C-n><C-w><C-h>")
-- vim.keymap.set({"n", "v", "o", "t"}, "<M-k>", "<C-\\><C-n><C-w><C-j>")
-- vim.keymap.set({"n", "v", "o", "t"}, "<M-l>", "<C-\\><C-n><C-w><C-k>")
-- vim.keymap.set({"n", "v", "o", "t"}, "<M-m>", "<C-\\><C-n><C-w><C-l>")
vim.keymap.set({ "t" }, "jk", "<C-\\><C-n>")
vim.keymap.set({ "t" }, "<C-q>", "<C-\\><C-n><CMD>q<CR>")
vim.keymap.set({ "v" }, "<", "<gv")
vim.keymap.set({ "v" }, ">", ">gv")
vim.keymap.set({ "n", "x", "v", "o" }, "<leader><Space>", "<CMD>b#<CR>")

vim.keymap.set("n", "<Esc>", "<CMD>noh<CR>")
vim.keymap.set("n", "<Tab>", "<CMD>bn<CR>")
vim.keymap.set("n", "<S-Tab>", "<CMD>bp<CR>")
vim.keymap.set({ "n", "o" }, "h", "]", { noremap = false })

local function is_qf_open()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.fn.buflisted(bufnr) == 1 then
      if vim.api.nvim_get_option_value("ft", { buf = bufnr }) == "qf" then
        return true
      end
    end
  end
  return false
end

vim.keymap.set("n", "<leader>c", function()
  if is_qf_open() then
    vim.cmd.cclose()
  else
    vim.cmd.copen()
  end
end)
