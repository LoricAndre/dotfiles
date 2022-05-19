local options = {
  autoindent = true,
  backspace = 'indent,eol,start',
  clipboard = 'unnamedplus',
  completeopt = 'menuone,noselect',
  expandtab = true,
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldmethod = 'expr',
  hidden = true,
  ignorecase = true,
  incsearch = true,
  mouse = 'a',
  number = true,
  relativenumber = true,
  ruler = true,
  scrolloff = 4,
  shiftwidth = 2,
  showmode = true,
  smarttab = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  timeoutlen = 300,
  undodir = vim.fn.stdpath("data") .. "/undodir",
  undofile = true,
  wildmenu = true
}

for k, v in pairs(options) do
  vim.o[k] = v
end
