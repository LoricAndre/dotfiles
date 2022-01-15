local g = vim.g

require'indent_blankline'.setup {
  show_current_context = true,
  show_current_context_start = true,
  use_treesitter = true,
  filetype_exclude = {
    'alpha'
  }
}
