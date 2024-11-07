return {
  'numToStr/Navigator.nvim',
  opts = {},
  -- lazy = false,
  keys = {
    {
      '<M-h>',
      function() require('Navigator').left() end,
      mode = { 'i', 'n', 't' },
      desc = '[TMX] Navigate left',
    },
    {
      '<M-j>',
      function() require('Navigator').down() end,
      mode = { 'i', 'n', 't' },
      desc = '[TMX] Navigate down',
    },
    {
      '<M-k>',
      function() require('Navigator').up() end,
      mode = { 'i', 'n', 't' },
      desc = '[TMX] Navigate up',
    },
    {
      '<M-l>',
      function() require('Navigator').right() end,
      mode = { 'i', 'n', 't' },
      desc = '[TMX] Navigate right',
    },
  },
}
