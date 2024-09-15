return {
  'nvimdev/lspsaga.nvim',
  enabled = false,
  after = "mason.nvim",
  config = function()
    require('lspsaga').setup({

    })
  end,
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
    { 'nvim-tree/nvim-web-devicons',     lazy = true },
  },
  event = 'LspAttach',
  keys = {
    -- {'<leader>lr', '<CMD>Lspsaga rename<CR>', desc = '[LSP] Rename'},
    -- {'K', '<CMD>Lspsaga hover_doc<CR>', desc = '[LSP] Hover Doc'},
    -- {'<leader>la', '<CMD>Lspsaga code_action<CR>', desc = '[LSP] Code Action'},
    { 'gn',         '<CMD>Lspsaga diagnostic_jump_next<CR>', desc = '[LSP] Next diagnostic' },
    { 'gp',         '<CMD>Lspsaga diagnostic_jump_prev<CR>', desc = '[LSP] Previous diagnostic' },
    -- {'<leader>lci', '<CMD>Lspsaga incoming_calls<CR>', desc = '[LSP] Incoming calls'},
    -- {'<leader>lco', '<CMD>Lspsaga outcoming_calls<CR>', desc = '[LSP] Outgoing calls'},
    -- {'<leader>lf', '<CMD>Lspsaga finder<CR>', desc = '[LSP] Finder'},
    { '<leader>lo', '<CMD>Lspsaga outline<CR>',              desc = '[LSP] Outline' },
  }
}
