local colorscheme = "catppuccin-mocha"


local repos = {
  nordfox = "EdenEast/nightfox.nvim",
  dracula = "Mofiqul/dracula.nvim",
  catpuccin = "catppuccin/nvim"
}

return {
  repos["catpuccin"],
  cond = false,
  config = function()
    vim.cmd("colorscheme " .. colorscheme)
  end
}
