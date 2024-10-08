local cmp_spec = require('plugins.cmp')

local overrides = {
  [1] = 'iguanacucumber/magazine.nvim',
  name = 'nvim-cmp',
  enabled = require('settings').completion == 'magazine'
}

return vim.tbl_deep_extend('force', cmp_spec, overrides)
