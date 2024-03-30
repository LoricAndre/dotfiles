return {
  "towolf/vim-helm",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      vim.o.termguicolors = true
      return require("colorizer").setup({
        ['*'] = {
          names = false
        }
      })
    end
  },
  {
    'glacambre/firenvim',
    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    lazy = not vim.g.started_by_firenvim,
    build = function()
      vim.fn["firenvim#install"](0)
    end
  }
}
