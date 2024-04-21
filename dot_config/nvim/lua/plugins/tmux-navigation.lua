return {
  'numToStr/Navigator.nvim',
  opts = {},
  lazy = false,
  keys = {
    { "<M-j>", function() require('Navigator').left() end,  mode = { "i", "n", "t" }, desc = "[TMX] Navigate left" },
    { "<M-k>", function() require('Navigator').down() end,  mode = { "i", "n", "t" }, desc = "[TMX] Navigate down" },
    { "<M-l>", function() require('Navigator').up() end,    mode = { "i", "n", "t" }, desc = "[TMX] Navigate up" },
    { "<M-m>", function() require('Navigator').right() end, mode = { "i", "n", "t" }, desc = "[TMX] Navigate right" },
  }
}
