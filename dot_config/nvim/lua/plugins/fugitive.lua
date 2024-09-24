return {
  'tpope/vim-fugitive',
  dependencies = {
    { 'cedarbaum/fugitive-azure-devops.vim', lazy = true },
    { 'tpope/vim-rhubarb', lazy = true },
    { 'shumphrey/fugitive-gitlab.vim', lazy = true },
    { 'tommcdo/vim-fugitive-blame-ext', lazy = true },
  },
  event = 'VeryLazy',
  enabled = false,
}
