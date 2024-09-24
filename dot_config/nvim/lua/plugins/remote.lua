return {
  'amitds1997/remote-nvim.nvim',
  enabled = false,
  version = '*', -- Pin to GitHub releases
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true }, -- For standard functions
    { 'MunifTanjim/nui.nvim', lazy = true }, -- To build the plugin UI
    { 'nvim-telescope/telescope.nvim', lazy = true }, -- For picking b/w different remote methods
  },
  opts = {},
}
