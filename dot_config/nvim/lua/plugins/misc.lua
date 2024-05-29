return {
  {
    "sheerun/vim-polyglot"
  },
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
  },
  {
    "chrisgrieser/nvim-chainsaw",
    opts = {},
    keys = {
      { "<leader>lv", function() require("chainsaw").variableLog() end, desc = "[LOG] Variable", noremap = true },
      { "<leader>ll", function() require("chainsaw").beepLog() end,     desc = "[LOG] Beep",     noremap = true },
      { "<leader>lo", function() require("chainsaw").objectLog() end,   desc = "[LOG] Object",   noremap = true },
      { "<leader>lt", function() require("chainsaw").timeLog() end,     desc = "[LOG] Time",     noremap = true },
    }
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "yorickpeterse/nvim-tree-pairs",
    opts = {}
  },
  {
    "Ramilito/kubectl.nvim",
    opts = {}
  }
}
