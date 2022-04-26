local vim = vim
local packer = require'utils'.packer
local config = require'config'

local defaults = {
  -- oneterm = 'LoricAndre/OneTerm.nvim',
  -- treesitter = {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
  -- comment = 'numToStr/Comment.nvim',
  -- sniprun = {'michaelb/sniprun', run = 'bash ./install.sh'},
  -- indent = 'lukas-reineke/indent-blankline.nvim',
  -- sidebar = 'sidebar-nvim/sidebar.nvim',
  -- commentBox = 'LudoPinelli/comment-box.nvim',
  -- feline = {'famiu/feline.nvim', requires = {
  --   'kyazdani42/nvim-web-devicons',
  --   'lewis6991/gitsigns.nvim'
  -- }},
  -- coq = {'ms-jpq/coq_nvim', requires = {
  --     {'ms-jpq/coq.artifacts', branch = 'artifacts'},
  --     {'ms-jpq/coq.thirdparty'}
  --   }
  -- },
  -- lsp = {'williamboman/nvim-lsp-installer', requires = {
  --   'neovim/nvim-lspconfig',
  --   'jubnzv/virtual-types.nvim',
  --   'weilbith/nvim-code-action-menu',
  --   'kosayoda/nvim-lightbulb',
  --   'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  -- }},
  -- alpha = 'goolord/alpha-nvim',
  -- {'haringsrob/nvim_context_vt', enabled = false},
  -- 'ggandor/lightspeed.nvim',
  -- persistence = 'folke/persistence.nvim',
  -- 'neomake/neomake',
  -- 'lewis6991/impatient.nvim',
  -- 'shaunsingh/nord.nvim',
  -- 'folke/tokyonight.nvim',
  -- 'tiagovla/tokyodark.nvim',
  -- catpuccin = 'catppuccin/nvim'
}

for name, desc in pairs(config.plugins) do
  if type(name) == 'string' then
    defaults[name] = desc
  else
    table.insert(defaults, desc)
  end
end

packer(defaults)
