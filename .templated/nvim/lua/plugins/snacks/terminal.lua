return {
  'snacks.nvim',
  opts = {
    styles = {
      terminal = {
        minimal = true,
        height = 0.25,
      },
    },
  },
  -- config = function(_, opts)
  --   local aug =
  --     vim.api.nvim_create_augroup('custom_snacks_terminal', { clear = true })
  --   vim.api.nvim_create_autocmd('FileType', {
  --     pattern = 'snacks_terminal',
  --     group = aug,
  --     callback = function(args)
  --       vim.api.nvim_create_autocmd('TermClose', {
  --         buffer = args.buf,
  --         group = aug,
  --         callback = function(_)
  --           vim.api.nvim_buf_delete(args.buf, {})
  --           vim.api.nvim_buf_delete(args.buf + 1, {})
  --         end,
  --       })
  --     end,
  --   })
  --   return require('snacks').setup(opts)
  -- end,
  keys = {
    {
      '<C-t>',
      function()
        Snacks.terminal.toggle()
      end,
      desc = 'Toggle terminal',
      mode = { 'n', 't' },
    },
  },
}
