vim.opt.termguicolors = true
vim.opt.langmap = 'hjklm;mhjkl'
vim.opt.laststatus = 3
vim.opt.completeopt = 'menu,menuone,popup,noselect,fuzzy'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = 'screen'
vim.opt.signcolumn = 'number'
vim.opt.number = true
vim.opt.shortmess = 'atToOCFc'
vim.opt.undofile = true
vim.o.wildoptions = 'pum,fuzzy'
vim.o.clipboard = 'unnamedplus'
vim.opt.diffopt = {
  'algorithm:minimal',
  'closeoff',
  'context:8',
  'filler',
  'internal',
  'linematch:100',
  'indent-heuristic',
}
-- vim.o.messagesopt = 'wait:0,history:1000'
-- Cursor
vim.o.cursorline = true
vim.o.cursorcolumn = true
-- Folds
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = 'fold: '

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

vim.g.netrw_list_hide = '^\\..*$,'
