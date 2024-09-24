return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    {
      'tpope/vim-dadbod',
      lazy = true,
    },
    {
      'kristijanhusak/vim-dadbod-completion',
      ft = { 'sql', 'mysql', 'plsql' },
      lazy = true,
    },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  config = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    -- local autocomplete_group = vim.api.nvim_create_augroup("vimrc_autocompletion", { clear = true })
    -- local cmp = require("cmp")
    -- vim.api.nvim_create_autocmd("FileType", {
    --   pattern = { "sql", "mysql", "plsql" },
    --   callback = function()
    --     cmp.setup.buffer({
    --       sources = {
    --         { name = "vim-dadbod-completion" },
    --         { name = "buffer" },
    --         { name = "luasnip" },
    --       },
    --     })
    --   end,
    --   group = autocomplete_group,
    -- })
  end,
}
