local options = {
  wrap = false,
  autoindent = true,
  title = true,
  backspace = 'indent,eol,start',
  clipboard = 'unnamedplus',
  completeopt = 'menu,menuone,popup,noinsert,noselect', --fuzzy',
  expandtab = true,
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldmethod = 'expr',
  foldlevelstart = 2,
  hidden = true,
  smartcase = true,
  incsearch = true,
  mouse = 'a',
  number = true,
  relativenumber = false,
  ruler = true,
  conceallevel = 1,
  scrolloff = 4,
  shiftwidth = 2,
  showmode = true,
  smarttab = true,
  softtabstop = 2,
  tabstop = 2,
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  guifont = 'monospace',
  timeoutlen = 300,
  undodir = vim.fn.stdpath('data') .. '/undodir',
  undofile = true,
  wildmenu = true,
  laststatus = 3,
  splitkeep = 'screen',
  -- statusline = require("statusline").build(),
  signcolumn = 'yes:1',
  sessionoptions = 'buffers,curdir,folds,tabpages,winpos,terminal',
}

for k, v in pairs(options) do
  vim.o[k] = v
end
