return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = 'Filetype',
  opts = {
    indent = {
      char = '┊'
    },
    exclude = {
      filetypes = {
        'dashboard',
        'lspinfo',
        'checkhealth',
        'help',
        'man',
        'gitcommit',
        'TelescopePrompt',
        'TelescopeResults',
        '',
      },
    },
  },
}
