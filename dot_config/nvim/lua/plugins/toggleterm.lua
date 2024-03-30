return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      local opts    = {
        open_mapping = "<C-t>",
        direction = "horizontal"
      }
      -- lazygit
      local Terminal  = require('toggleterm.terminal').Terminal
      Lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      K9s = Terminal:new({ cmd = "k9s", hidden = true, direction = "float" })

      return require("toggleterm").setup(opts)
    end,
    event   = "VeryLazy",
    keys = {
      {"<leader>gg", function() Lazygit:toggle() end, desc = "[GIT] Toggle Lazygit"},
      {"<leader>k", function() K9s:toggle() end, desc = "[k8s] Toggle k9s"},
    }
  }
}
