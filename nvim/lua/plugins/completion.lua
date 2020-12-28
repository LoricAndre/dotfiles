local vim = vim
require'utils'

return function()
  vim.g.completion_chain_complete_list = {
    default = {
      default = {
        {complete_items = {'lsp', 'ts'}},
          {mode = '<c-p>'},
          { mode = '<c-n>'}
      },
      comment =  {},
      string = {
        {complete_items = {'path'}}
      }
    }
  }
  au('BufEnter', '*', 'lua require"completion".on_attach()')
  vim.o.completeopt = "menuone,noinsert,noselect"
  vim.o.shortmess = vim.o.shortmess .. "c"
  vim.g.completion_matching_smart_case = 1
  vim.g.completion_matching_strategy_list = {'exact', 'fuzzy', 'substring'}
  map('i', '<Tab>', 'pumvisible() ? "<C-n>" :  "<Tab>"', {expr = true})
  map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" :  "<S-Tab>"', {expr = true})
end
