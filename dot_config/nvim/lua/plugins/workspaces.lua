return {
  "natecraddock/workspaces.nvim",
  enabled = false,
  opts = {
    hooks = {
      open = function()
        local buffers = vim.api.buffers
        local has_persistence, persistence = pcall(require, "persistence")
        if has_persistence then
          pcall(persistence.load)
        end
      end
    }
  },
  event = "VeryLazy"
}
