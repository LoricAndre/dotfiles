vim.cmd('packadd packer.nvim')

require('packer').startup(function()
  local use = use
  -- packer
  use {'git@github.com:wbthomason/packer.nvim', opt = true}

  -- Misc utilities
  use 'git@github.com:tpope/vim-commentary' -- comments
  use 'git@github.com:tpope/vim-obsession' -- Session management
  use 'git@github.com:ryanoasis/vim-devicons' -- Icons
  use {'git@github.com:LoricAndre/fzterm.nvim', branch = 'main', config = function() require'plugins.misc'.fzterm() end} -- <- <3
  use 'git@github.com:lilydjwg/colorizer' -- Hilight hex code with color #000
  use {'git@github.com:tmsvg/pear-tree', config = function() require'plugins.misc'.pearTree() end}
  use {'git@github.com:Shougo/echodoc.vim', config = function() vim.g["echodoc#enable_at_startup"] = -1 end}
  use 'stevearc/vim-arduino'
  use {
    'theHamsta/nvim-dap-virtual-text',
    requires = 'mfussenegger/nvim-dap',
    config = function() require'plugins.misc'.dap() end
  }
  use 'tpope/vim-surround'
  use {'vimwiki/vimwiki', config = function() require'plugins.misc'.vimwiki() end}
  -- use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}, config = function() require'plugins.misc'.telescope() end}
  use {'glacambre/firenvim', run = ':call firenvim#install(0)'}

  -- Colorschemes
  use 'git@github.com:christianchiarulli/nvcode-color-schemes.vim' -- has treesitter
  use 'git@github.com:junegunn/seoul256.vim'
  use 'git@github.com:bluz71/vim-moonfly-colors'
  use 'dylanaraps/wal.vim'
  use 'LoricAndre/lule.nvim'
  use 'jsit/disco.vim'
  -- Classes
  use {'git@github.com:tyru/eskk.vim', config = function() require'plugins.classes'.eskk() end}
  use {'git@github.com:xolox/vim-notes', requires = 'xolox/vim-misc', config = function() require'plugins.classes'.notes() end}

  -- Neovim 5.0 goodness
  -- Treesitter
  use {'git@github.com:nvim-treesitter/nvim-treesitter', config = function() require'plugins.treesitter'() end}
  use {'git@github.com:nvim-treesitter/completion-treesitter'}
  -- LSP
  use {'git@github.com:neovim/nvim-lspconfig', config = function() require'plugins.lsp'.lsp() end}
  -- Completion
  use {'git@github.com:nvim-lua/completion-nvim', config = function() require'plugins.completion'() end}
end)
