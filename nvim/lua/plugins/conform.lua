return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    enabled = false,
    keys = {
      {
        -- Customize or remove this keymap to your liking
        '<leader>cf',
        function()
          vim.cmd.doautocmd('User', 'ConformFormatPre')
          require('conform').format({
            async = true,
            callback = function(err, did_edit)
              if not err and did_edit then
                vim.cmd.doautocmd('User', 'ConformFormatPost')
                vim.notify(
                  'Formatted buffer',
                  vim.log.levels.INFO,
                  { title = 'conform' }
                )
              else
                vim.notify(
                  'Failed to format buffer: ' .. err,
                  vim.log.levels.INFO,
                  { title = 'conform' }
                )
              end
            end,
          })
        end,
        mode = '',
        desc = '[cfm] format buffer',
      },
    },
    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type conform.setupOpts
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_organize_imports', 'ruff_format' },
        rust = { 'rustfmt' },
        javascript = {
          'eslint',
          'prettierd',
          'prettier',
          stop_after_first = true,
        },
        ['_'] = { 'trim_whitespace' },
      },
      -- Set default options
      default_format_opts = {
        lsp_format = 'fallback',
      },
      -- Set up format-on-save
      format_on_save = nil, --{ timeout_ms = 500 },
      -- Customize formatters
      -- formatters = {
      --   shfmt = {
      --     prepend_args = { "-i", "2" },
      --   },
      -- },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      vim.api.nvim_create_autocmd('BufWritePre', {
        desc = 'Format on save',
        pattern = '*',
        group = vim.api.nvim_create_augroup('custom_conform', { clear = true }),
        callback = function(args)
          if
              not vim.api.nvim_buf_is_valid(args.buf)
              or vim.bo[args.buf].buftype ~= ''
          then
            return
          end
          vim.cmd.doautocmd('User', 'ConformFormatPre')
          require('conform').format({
            buf = args.buf,
            async = false,
            timeout_ms = 500,
          })
          vim.cmd.doautocmd('User', 'ConformFormatPost')
        end,
      })
    end,
  },
  {
    'zapling/mason-conform.nvim',
    after = { 'conform.nvim', 'mason.nvim' },
    opts = {},
    event = { 'User ConformFormatPre' },
  },
}
