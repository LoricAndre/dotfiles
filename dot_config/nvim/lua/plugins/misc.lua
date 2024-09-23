return {
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim"
  --   },
  --   opts = {}
  -- },
  {
    "sheerun/vim-polyglot",
    event = "VeryLazy"
  },
  -- {
  --   "norcalli/nvim-colorizer.lua",
  --   event = "Filetype",
  --   config = function()
  --     vim.o.termguicolors = true
  --     return require("colorizer").setup({
  --       ['*'] = {
  --         names = false
  --       }
  --     })
  --   end
  -- },
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
  -- {
  --   "Ramilito/kubectl.nvim",
  --   opts = {}
  -- },
  {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
        },
      },
    },
  },
  { "mistricky/codesnap.nvim", build = "make", cmd = { "CodeSnap", "CodeSnapAscii", "CodeSnapHighlight", "CodeSnapSave", "CodeSnapSaveHighlight" } },
}
