return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  opts = {
    languages = {
      cs = {
        template = {
          annotation_convention = "xmldoc"
        }
      }
    }
  },
  version = "*",
  cmd = "Neogen",
  module = "neogen",
  keys = {
    { "gC", function() require("neogen").generate({}) end }
  }
}
