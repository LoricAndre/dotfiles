return {
  "olimorris/persisted.nvim",
  enabled = false,
  lazy = false,
  config = function(opts)
    local group = vim.api.nvim_create_augroup("PersistedHooks", {})

    vim.api.nvim_create_autocmd({ "User" }, {
      pattern = "PersistedTelescopeLoadPre",
      group = group,
      callback = function(_)
        -- Save the currently loaded session using a global variable
        require("persisted").save({ session = vim.g.persisted_loaded_session })

        -- Delete all of the open buffers
        vim.api.nvim_input("<ESC>:%bd!<CR>")
      end,
    })
    return require("persisted").setup(opts)
  end,
  opts = {
    use_git_branch = true,
    autosave = true,
    autocreate = true,
    telescope = {
      reset_prompt = true, -- Reset the Telescope prompt after an action?
      mappings = {         -- table of mappings for the Telescope extension
        change_branch = "<c-b>",
        copy_session = "<c-c>",
        delete_session = "<c-d>",
      },
    },
    ignored_dirs = {
      "~/.config",
      "~/.local/nvim",
      { "/",    exact = true },
      { "/tmp", exact = true }
    },
  },
}
