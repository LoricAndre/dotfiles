return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dim = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = {
      style = 'minimal',
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      lazygit = {
        height = 0.7,
        width = 0.7,
      },
    },
  },
  keys = {
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'LazyGit',
    },
    {
      '<leader>d',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Close buffer',
    },
    {
      '<leader>N',
      function()
        Snacks.notifier.show_history()
      end,
      desc = 'Close buffer',
      silent = true,
    },
  },
}
