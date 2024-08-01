return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config  = function()
      local opts     = {
        open_mapping = "<C-t>",
        direction = "horizontal",
        on_open = function(_)
          -- Fix for layout with sidebar
          local has_sidebar, sidebar = pcall(require, "sidebar-nvim.lib")
          if has_sidebar then
            if sidebar.is_open() then
              local win = vim.api.nvim_get_current_win()
              vim.defer_fn(function()
                require("sidebar-nvim").close()
                require("sidebar-nvim").open()
                print(win)
                vim.api.nvim_set_current_win(win)
              end, 20)
            end
          end
        end
      }
      -- lazygit
      local Terminal = require('toggleterm.terminal').Terminal
      Lazygit        = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      K9s            = Terminal:new({ cmd = "k9s", hidden = true, direction = "float" })

      return require("toggleterm").setup(opts)
    end,
    event   = "VeryLazy",
    keys    = {
      { "<leader>gg", function() Lazygit:toggle() end, desc = "[GIT] Toggle Lazygit" },
      { "<leader>k",  function() K9s:toggle() end,     desc = "[k8s] Toggle k9s" },
    }
  }
}
