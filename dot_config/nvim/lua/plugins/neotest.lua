return {
  'nvim-neotest/neotest',
  enabled = false,
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-python',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-python')({
          runner = 'unittest',
        }),
      },
    })
  end,
}
