return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  enabled = vim.g.colorscheme:sub(1, #'tokyonight') == 'tokyonight',
  init = function()
    vim.cmd.colorscheme(vim.g.colorscheme)
  end,
}
