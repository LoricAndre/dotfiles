vim.cmd [[
  packadd packer.nvim
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins/init.lua source <afile> | PackerCompile
  augroup end
]]

return require'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'LionC/nest.nvim',
    config = function() require'mappings' end
  }

  use {
    'LoricAndre/OneTerm.nvim',
    config = function() require'plugins.oneterm' end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = 'maintained'
      }
    end
  }

  use {
    'haringsrob/nvim_context_vt',
    after = 'nvim-treesitter'
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
        require'Comment'.setup()
    end
  }

  use {
    'michaelb/sniprun',
    run = 'bash ./install.sh',
    config = function() require'plugins.sniprun' end,
    after = 'nest.nvim'
  }

  use {
    'famiu/feline.nvim',
    requires = {'kyazdani42/nvim-web-devicons', 'lewis6991/gitsigns.nvim'},
    config = function() require'plugins.feline' end
  }

  use {
    'williamboman/nvim-lsp-installer',
    requires = {
      'neovim/nvim-lspconfig',
      'jubnzv/virtual-types.nvim',
      'weilbith/nvim-code-action-menu',
      'kosayoda/nvim-lightbulb'
    },
    after = 'nest.nvim',
    config = function() require'plugins.lsp' end
  }

  use {
    'shaunsingh/nord.nvim',
    config = function() vim.cmd('colorscheme nord') end
  }

  use {
    'ms-jpq/coq_nvim',
    requires = {
      {'ms-jpq/coq.artifacts', branch = 'artifacts'},
      {'ms-jpq/coq.thirdparty'}
    },
    config = function() require'plugins.coq' end
  }

  use {
    'ggandor/lightspeed.nvim'
  }

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require'plugins.barbar' end
  }

  use {
    'folke/persistence.nvim',
    config = function() require'plugins.persistence' end,
  }

  use {
    'goolord/alpha-nvim',
    config = function() require'plugins.alpha' end
  }

  use {
    'neomake/neomake'
  }
end)
