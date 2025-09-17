return {
  'rebelot/terminal.nvim',
  enabled = false,
  opts = {
    layout = { open_cmd = 'botright new', height = 16 },
    cmd = { vim.o.shell },
    autoclose = true
  },
  keys = {
    { '<leader>t', function() require('terminal').open() end },
  }
}
