local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end
return require 'packer'.startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }
  use { 'nvim-telescope/telescope.nvim',
    module = 'telescope',
    cmd = { 'Telescope' },
    keys = { '<leader>f', '<leader>a', '<leader>b' },
    requires = {
      'nvim-lua/popup.nvim',
      { 'nvim-lua/plenary.nvim', opt = false },
      'nvim-telescope/telescope-media-files.nvim',
      'cljoly/telescope-repo.nvim',
      'gbrlsnchs/telescope-lsp-handlers.nvim',
      'rcarriga/nvim-notify',
    },
    config = function() require 'plugins.telescope' end,
    rocks = {
      'openssl',
      'lua-http-parser'
    }
  }
  use { 'akinsho/toggleterm.nvim',
    config = function() require 'plugins.toggleterm' end
  }
  use { 'goolord/alpha-nvim',
    config = function() require 'plugins.alpha' end
  }
  use { 'numToStr/Comment.nvim',
    config = function() require 'plugins.comment' end
  }
  use { 'LudoPinelli/comment-box.nvim',
    config = function() require 'plugins.comment-box' end
  }
  use { 'ms-jpq/coq_nvim',
    branch = 'coq',
    config = function() require 'plugins.coq' end,
    requires = {
      { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
      { 'ms-jpq/coq.thirdparty', branch = '3p' },
      'github/copilot.vim'
    },
    run = ':COQdeps'
  }
  use { 'feline-nvim/feline.nvim',
    config = function() require 'plugins.feline' end,
    requires = {
      'kyazdani42/nvim-web-devicons',
      'lewis6991/gitsigns.nvim',
    }
  }
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function() require 'plugins.indent-blankline' end
  }
  use { 'nvim-treesitter/nvim-treesitter',
    config = function() require 'plugins.treesitter' end,
    run = ':TSUpdate'
  }
  use { 'neovim/nvim-lspconfig',
    config = function() require 'plugins.lsp' end,
    requires = {
      'jubnzv/virtual-types.nvim',
      'kosayoda/nvim-lightbulb',
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      'williamboman/nvim-lsp-installer'
    },
  }
  use { 'folke/persistence.nvim',
    config = function() require 'plugins.persistence' end
  }
  use { 'LoricAndre/sidebar.nvim',
    config = function() require 'plugins.sidebar' end
  }
  use { 'michaelb/sniprun',
    config = function() require 'plugins.sniprun' end,
    run = 'bash ./install.sh'
  }
  use { 'lewis6991/impatient.nvim' }
  use { 'ggandor/lightspeed.nvim' }
  use { 'neomake/neomake' }
  use { 'shaunsingh/nord.nvim' }
  use { 'tiagovla/tokyodark.nvim' }
  use { 'folke/tokyonight.nvim' }
  use { 'ygm2/rooter.nvim' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'RRethy/nvim-base16' }
  use { 'shaunsingh/seoul256.nvim' }
  use { 'nekonako/xresources-nvim' }
end)
