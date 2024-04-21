local chezmoi_dir = vim.fn.expand("~/.local/share/chezmoi")

local autocmds = {
  -- { "BufEnter", "term://*", "echom 2" },
  -- { "BufLeave", "term://*", "stopinsert" },
  -- { "BufWritePost", chezmoi_dir .. "/**", "silent!chezmoi apply" }
}

local group = vim.api.nvim_create_augroup("custom_autocmds", { clear = true })
for _, opts in ipairs(autocmds) do
  print(vim.inspect(opts))
  if type(opts[3]) == "string" then
    print("Command", opts[3])
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
