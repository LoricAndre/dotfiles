local maps = require'nest'.applyKeymaps
local m = require'mappings.constants'
local ot = require'oneterm'

vim.g.oneterm_yank = true
vim.g.oneterm_options = {border = "rounded"}
vim.g.oneterm_sessions_path = vim.fn.expand(vim.fn.stdpath('data') .. '/sessions/')

maps {
  {mode = 'n', {
    {'<leader>', {
      {m.s, {
        {m.f, '<CMD>OneTerm files_or_git_files<CR>'},
        {m.F, '<CMD>OneTerm files<CR>'},
        {m.l, '<CMD>OneTerm lines<CR>'},
        {m.a, '<CMD>OneTerm ag<CR>'},
        {m.g, '<CMD>OneTerm git<CR>'},
        {m.r, '<CMD>OneTerm references<CR>'},
        {m.R, '<CMD>OneTerm workspace_references<CR>'},
        {m.s, '<CMD>OneTerm symbols<CR>'},
        {m.S, '<CMD>OneTerm ws_symbols<CR>'},
        {m.b, '<CMD>OneTerm buffers<CR>'},
        {m.y, '<CMD>OneTerm yanks<CR>'}
      }},
      {m.t, '<CMD>OneTerm term<CR>'},
      {m.r, '<CMD>OneTerm ranger<CR>'},
      {m.f, '<CMD>OneTerm files_or_git_files<CR>'},
      {m.b, '<CMD>OneTerm buffers<CR>'},
      {m.g, '<CMD>OneTerm git<CR>'},
    }}
  }}
}
