local vim = vim
local map = require'utils'.map
local ot = require'oneterm'

vim.g.oneterm_yank = true
vim.g.oneterm_options = {border = "rounded"}
vim.g.oneterm_sessions_path = vim.fn.expand(vim.fn.stdpath('data') .. '/sessions/')

map {
  n = {
    {'<leader>sf', ot.files_or_git_files},
    {'<leader>sF', ot.files},
    {'<leader>sl', ot.lines},
    {'<leader>sa', ot.ag},
    {'<leader>sg', ot.git},
    {'<leader>sr', ot.references},
    {'<leader>sR', ot.workspace_references},
    {'<leader>ss', ot.symbols},
    {'<leader>sS', ot.ws_symbols},
    {'<leader>sb', ot.buffers},
    {'<leader>sy', ot.yanks},
    {'<leader>t', ot.term},
    {'<leader>r', ot.ranger},
    {'<leader>f', ot.files_or_git_files},
    {'<leader>b', ot.buffers},
    {'<leader>g', ot.git},
    {'<leader>z', ot.z}
  }
}
