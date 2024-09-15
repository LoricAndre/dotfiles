return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "Filetype",
  opts = {
    exclude = {
      filetypes = {
        "dashboard",
        "lspinfo",
        "checkhealth",
        "help",
        "man",
        "gitcommit",
        "TelescopePrompt",
        "TelescopeResults",
        ""
      }
    }
  }
}
