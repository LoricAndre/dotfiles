local chezmoi_dir = vim.fn.expand("~/.local/share/chezmoi")

local autocmds = {
  -- Sidebar
  { "BufEnter", "SidebarNvim_*", function()
    vim.keymap.set("n", "k", "<Down>", { noremap = true, buffer = true })
    vim.keymap.set("n", "l", "<Up>", { noremap = true, buffer = true })
    vim.keymap.set("n", "m", "e", { noremap = false, buffer = true })
    vim.keymap.set("n", "j", "t", { noremap = false, buffer = true })
  end },
  { "BufWinEnter", "?*",       "silent! loadview 1" },
  { "BufWinLeave", "?*",       "silent! mkview 1" },
  { "BufEnter",    "term://*", "startinsert" },
  { "BufLeave",    "term://*", "stopinsert" },
  { 'BufWritePost', chezmoi_dir .. '/*', function()
    vim.notify('[chezmoi] Applying dotfiles changes...')
    local ret = vim.system({ 'cp', vim.fn.expand('~/.config/nvim/lazy-lock.json'), chezmoi_dir .. '/dot_config/nvim' }):wait()
    if ret.code ~= 0 then
      vim.notify('[ERR] failed to copy lazy-lock: ' .. ret.stderr)
    end
    vim.system({ 'chezmoi', 'apply' }):wait()
    vim.notify('[chezmoi] Applied dotfiles changes')
  end }
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
