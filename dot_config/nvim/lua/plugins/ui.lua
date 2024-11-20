return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
    },
    event = 'VeryLazy',
    keys = {
      {
        '<leader>gs',
        function() return require('gitsigns').stage_hunk() end,
        desc = '[GIT] Stage Hunk',
      },
      {
        '<leader>gs',
        function()
          return require('gitsigns').stage_hunk({
            vim.fn.line('.'),
            vim.fn.line('v'),
          })
        end,
        desc = '[GIT] Stage Selected',
        mode = 'v',
      },
      {
        '<leader>gu',
        function() return require('gitsigns').undo_stage_hunk() end,
        desc = '[GIT] Unstage Hunk',
      },
      {
        '<leader>gu',
        function()
          return require('gitsigns').undo_stage_hunk({
            vim.fn.line('.'),
            vim.fn.line('v'),
          })
        end,
        desc = '[GIT] Unstage Selected',
        mode = 'v',
      },
      {
        '<leader>gr',
        function() return require('gitsigns').reset_hunk() end,
        desc = '[GIT] Reset Hunk',
      },
      {
        '<leader>gr',
        function()
          return require('gitsigns').reset_hunk({
            vim.fn.line('.'),
            vim.fn.line('v'),
          })
        end,
        desc = '[GIT] Reset Selected',
        mode = 'v',
      },
      {
        '<leader>gp',
        function() return require('gitsigns').preview_hunk() end,
        desc = '[GIT] Preview Hunk',
      },
      {
        '<leader>gp',
        function()
          return require('gitsigns').preview_hunk({
            vim.fn.line('.'),
            vim.fn.line('v'),
          })
        end,
        desc = '[GIT] Preview Selected',
        mode = 'v',
      },
      {
        '<leader>gS',
        function() return require('gitsigns').stage_buffer() end,
        desc = '[GIT] Stage Buffer',
      },
      {
        '<leader>gR',
        function() return require('gitsigns').reset_buffer() end,
        desc = '[GIT] Reset Buffer',
      },
      {
        '<leader>gb',
        function() return require('gitsigns').blame_line() end,
        desc = '[GIT] Blame Line',
      },
      {
        '<leader>gB',
        function() return require('gitsigns').toggle_current_line_blame() end,
        desc = '[GIT] Blame Line',
      },
      {
        '<leader>gd',
        function() return require('gitsigns').diffthis() end,
        desc = '[GIT] Diff Hunk',
      },
      {
        '<leader>gt',
        function() return require('gitsigns').toggle_deleted() end,
        desc = '[GIT] Toggle Deleted Lines',
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', lazy = true },
    event = 'VeryLazy',
    opts = {},
  },
  { 'kevinhwang91/nvim-bqf', ft = 'qf' },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    enabled = false,
    opts = {

    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      { 'MunifTanjim/nui.nvim', lazy = true },
    },
  },
}
