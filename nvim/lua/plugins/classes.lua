require'utils'

-- Eskk (japanese)
M = {}
M.eskk = function()
  vim.api.nvim_set_var("eskk#large_dictionary", {
    path = "/usr/share/skk/SKK-JISYO.L",
    sorted = 1,
    encoding = "euc-jp"
  })
end

-- Notes
M.notes = function()
  vim.g.notes_directories = {'~/Files/Dropbox/notes'}
  vim.g.notes_suffix = '.txt'
end

return M
