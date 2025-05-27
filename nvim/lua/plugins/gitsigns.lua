return {
  'lewis6991/gitsigns.nvim',
  event = 'FileType',
  opts = {},
  keys = {
    {
      ']c',
      function()
        require('gitsigns').nav_hunk('next')
      end,
      desc = '[git] next hunk',
    },
    {
      '[c',
      function()
        require('gitsigns').nav_hunk('prev')
      end,
      desc = '[git] previous hunk',
    },
    {
      '<C-n>',
      function()
        if vim.fn.pumvisible() == 1 then
          vim.api.nvim_feedkeys('<C-n>', 'n', false)
        else
          require('gitsigns').nav_hunk('next')
        end
      end,
      desc = '[git] next hunk',
    },
    {
      '<C-p>',
      function()
        if vim.fn.pumvisible() == 1 then
          vim.api.nvim_feedkeys('<C-p>', 'n', false)
        else
          require('gitsigns').nav_hunk('prev')
        end
      end,
      desc = '[git] previous hunk',
    },
    {
      '<leader>gs',
      function()
        require('gitsigns').stage_hunk()
      end,
      desc = '[git] stage hunk',
    },
    {
      '<leader>gr',
      function()
        require('gitsigns').reset_hunk()
      end,
      desc = '[git] reset hunk',
    },
    {
      '<leader>gs',
      function()
        require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end,
      mode = 'v',
      desc = '[git] stage hunk',
    },
    {
      '<leader>gr',
      function()
        require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end,
      mode = 'v',
      desc = '[git] reset hunk',
    },

    {
      '<leader>gS',
      function()
        require('gitsigns').stage_buffer()
      end,
      desc = '[git] stage buffer',
    },
    {
      '<leader>gR',
      function()
        require('gitsigns').reset_buffer()
      end,
      desc = '[git] reset buffer',
    },
    {
      '<leader>gp',
      function()
        require('gitsigns').preview_hunk()
      end,
      desc = '[git] preview hunk',
    },
    {
      '<leader>gi',
      function()
        require('gitsigns').preview_hunk_inline()
      end,
      desc = '[git] preview hunk inline',
    },

    {
      '<leader>gd',
      function()
        require('gitsigns').diffthis()
      end,
      desc = '[git] diff against the index',
    },

    {
      '<leader>gD',
      function()
        require('gitsigns').diffthis('~')
      end,
      desc = '[git] diff against last commit',
    },

    {
      '<leader>gQ',
      function()
        require('gitsigns').setqflist('all')
      end,
      desc = '[git] send all diffs to quick fix list',
    },
    {
      '<leader>gq',
      function()
        require('gitsigns').setqflist()
      end,
      desc = '[git] send diff to quick fix',
    },

    -- Toggles
    {
      '<leader>gb',
      function()
        require('gitsigns').toggle_current_line_blame()
      end,
      desc = '[git] toggle current line blame',
    },
    {
      '<leader>gw',
      function()
        require('gitsigns').toggle_word_diff()
      end,
      desc = '[git] toggle word diff',
    },

    -- Text object
    {
      'ih',
      function()
        require('gitsigns').select_hunk()
      end,
      mode = { 'o', 'x' },
      desc = '[git] select hunk',
    },
  },
}
