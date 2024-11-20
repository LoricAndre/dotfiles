return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 2000,
      style = 'compact',
    },
    lazygit = {
      enabled = true,
      win = {
        style = 'lazygit',
        height = 0.75 * vim.o.lines,
        width = 0.75 * vim.o.columns,
        backdrop = 100,
      },
    },
    dashboard = require('plugins.snacks.dashboard'),
    terminal = require('plugins.snacks.terminal'),
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    styles = {
      notification = {
        border = 'rounded',
        zindex = 100,
        wo = {
          winblend = 5,
          wrap = true,
        },
        bo = { filetype = 'markdown' },
      },
      lazygit = {
        border = 'rounded',
      },
    },
  },
  keys = {
    {
      '<leader>un',
      function() Snacks.notifier.hide() end,
      desc = 'Dismiss All Notifications',
    },
    {
      '<leader>bd',
      function() Snacks.bufdelete() end,
      desc = 'Delete Buffer',
    },
    { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
    {
      '<leader>gb',
      function() Snacks.git.blame_line() end,
      desc = 'Git Blame Line',
    },
    { '<leader>gB', function() Snacks.gitbrowse() end, desc = 'Git Browse' },
    {
      '<leader>gf',
      function() Snacks.lazygit.log_file() end,
      desc = 'Lazygit Current File History',
    },
    {
      '<leader>gl',
      function() Snacks.lazygit.log() end,
      desc = 'Lazygit Log (cwd)',
    },
    { '<leader>cR', function() Snacks.rename() end, desc = 'Rename File' },
    {
      '<C-t>',
      function() Snacks.terminal() end,
      desc = 'Toggle Terminal',
      mode = { 'n', 't' },
    },
    {
      '<leader>N',
      desc = 'Neovim News',
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = 'yes',
            statuscolumn = ' ',
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        ---@diagnostic disable-next-line: duplicate-set-field
        _G.dd = function(...) Snacks.debug.inspect(...) end
        ---@diagnostic disable-next-line: duplicate-set-field
        _G.bt = function() Snacks.debug.backtrace() end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>uw')
        Snacks.toggle
          .option('relativenumber', { name = 'Relative Number' })
          :map('<leader>uL')
        Snacks.toggle.diagnostics():map('<leader>ud')
        Snacks.toggle.line_number():map('<leader>ul')
        Snacks.toggle
          .option('conceallevel', {
            off = 0,
            on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
          })
          :map('<leader>uc')
        Snacks.toggle.treesitter():map('<leader>uT')
        Snacks.toggle
          .option(
            'background',
            { off = 'light', on = 'dark', name = 'Dark Background' }
          )
          :map('<leader>ub')
        Snacks.toggle.inlay_hints():map('<leader>uh')
      end,
    })
  end,
}
