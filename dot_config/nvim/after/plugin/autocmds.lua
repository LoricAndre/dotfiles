local chezmoi_dir = vim.fn.expand("~/.local/share/chezmoi")

local autocmds = {
  -- Sidebar
  { "BufEnter", "SidebarNvim_*", function()
    vim.keymap.set("n", "k", "<Down>", { noremap = true, buffer = true })
    vim.keymap.set("n", "l", "<Up>", { noremap = true, buffer = true })
    vim.keymap.set("n", "m", "e", { noremap = false, buffer = true })
    vim.keymap.set("n", "j", "t", { noremap = false, buffer = true })
  end },
  { "BufWinEnter", "?*", "silent! loadview 1" },
  { "BufWinLeave", "?*", "silent! mkview 1" },
  { "BufEnter", "term://*", "startinsert" },
  { "BufLeave", "term://*", "stopinsert" },
}

local group = vim.api.nvim_create_augroup("custom_autocmds", { clear = true })
for _, opts in ipairs(autocmds) do
  if type(opts[3]) == "string" then
    vim.api.nvim_create_autocmd(opts[1], {
      pattern = opts[2],
      command = opts[3],
      group = group
    })
  else
    vim.api.nvim_create_autocmd(opts[1], {
      pattern = opts[2],
      callback = opts[3],
      group = group
    })
  end
end
