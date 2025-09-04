return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  enabled = false,
  opts = {
    close_when_all_hidden = true,
    bottom = {
      {
        title = 'Terminal',
        ft = 'toggleterm',
        size = { height = 0.3 },
        filter = function(buf)
          return vim.api.nvim_win_get_config(vim.api.nvim_get_current_win()).relative == ''
        end,
        open = function()
          vim.cmd('ToggleTerm')
        end,
      },
      {
        title = 'Neotest Summary',
        ft = 'neotest-summary',
        size = { height = 0.3 },
      },
      {
        title = 'Trouble',
        ft = 'Trouble',
        size = { height = 0.3 },
      },
    },
    right = {
      {
        title = 'File Explorer',
        ft = 'neo-tree',
        size = { width = 0.2 },
        pinned = true,
        open = 'Neotree position=left',
      },
      {
        title = 'Git Changes',
        ft = 'DiffviewFiles',
        size = { width = 0.2, height = 1 },
      },
      {
        title = 'Outline',
        ft = 'symbols-outline',
        size = { width = 0.2, height = 1 },
      },
      {
        title = 'LSP Info',
        ft = 'lspinfo',
        size = { width = 0.2, height = 1 },
      },
      {
        title = 'Quickfix',
        ft = 'qf',
        size = { width = 0.2, height = 1 },
      },
      {
        title = 'CodeCompanion',
        ft = 'codecompanion',
        size = { width = 0.3 },
        pinned = true,
        collapsed = true,
        open = 'CodeCompanionChat'
      }
    },
    animate = {
      enabled = false,
      fps = 60,
      cps = 120,
    },
  },
}
