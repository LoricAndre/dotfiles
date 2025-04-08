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
      opts = {
        sources = {
          per_filetype = {
            sql = { 'dadbod' },
          },
        },
      },
    },
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
  config = function(_, opts)
    local has_blink, blink = pcall(require, 'blink.cmp')
    if has_blink then
      blink.add_provider(
        'dadbod',
        { name = 'Dadbod', module = 'vim_dadbod_completion.blink' }
      )
    end
  end,
}
