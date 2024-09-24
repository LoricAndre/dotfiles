return {
  'nvimdev/indentmini.nvim',
  event = 'BufEnter',
  config = function()
    require('indentmini').setup({
      exclude = {
        'dashboard',
      },
    })
    vim.cmd.highlight('default link IndentLine Comment')
  end,
  enabled = false,
}
