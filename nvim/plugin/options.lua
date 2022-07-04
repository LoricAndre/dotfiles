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
  guifont = 'monospace',
  timeoutlen = 300,
  undodir = vim.fn.stdpath("data") .. "/undodir",
  undofile = true,
  wildmenu = true
}

for k, v in pairs(options) do
  vim.o[k] = v
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'yaml',
  callback = function()
    vim.api.nvim_command('filetype indent off')
    vim.bo.autoindent = false
  end
})
