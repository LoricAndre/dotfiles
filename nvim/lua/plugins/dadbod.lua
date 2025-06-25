local filetypes = {
  'sql',
  'mysql',
  'plsql',
}
return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    {
      'kristijanhusak/vim-dadbod-completion',
      ft = filetypes,
      lazy = true,
    },
    {
      'blink.cmp',
      cond = function() return vim.g.completion == 'blink' end,
      lazy = true,
      opts = {
        sources = {
          per_filetype = {
            sql = { 'dadbod' },
            mysql = { 'dadbod' },
            plsql = { 'dadbod' },
          },
          providers = {
            dadbod = { module = 'vim_dadbod_completion.blink' },
          },
        },
      },
    },
    {
      'ms-jpq/coq.thirdparty',
      lazy = true,
      cond = function() return vim.g.completion == 'coq' end,
      config = function()
        require('coq_3p')({
          { src = 'vim_dadbod_completion', short_name = 'DB' },
        })
      end
    }
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  ft = filetypes,
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}
