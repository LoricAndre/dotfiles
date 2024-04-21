return {
  "Shatur/neovim-session-manager",
  event = "VeryLazy",
  config = function ()
    require("session_manager").setup({

    })
    local config_group = vim.api.nvim_create_augroup('session_manager', {}) -- A global group for all your config autocommands
    vim.api.nvim_create_autocmd({ 'User' }, {
      pattern = "SessionLoadPost",
      group = config_group,
      callback = function()
        -- require("edgy").open()
      end,
    })
  end
}
