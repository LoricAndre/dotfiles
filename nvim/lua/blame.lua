local vim = vim
local api = vim.api

local blame = vim.fn.systemlist("git blame")

local buf = api.nvim_create_buf(true, true)

api.nvim_buf_set_lines(buf, 0, 0, false, blame)
api.nvim_open_win(buf, false, {relative='win'})
