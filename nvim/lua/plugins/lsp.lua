local map = require'utils'.map
local au = vim.api.nvim_create_autocmd
local lsp = vim.lsp.buf

map {
  n = {
    {'<leader>ld', lsp.definition},
    {'<leader>lD', lsp.declaration},
    {'<leader>lK', lsp.hover},
    {'<leader>li', lsp.implementation},
    {'<leader>ls', lsp.signature_help},
    {'<leader>lt', lsp.type_definition},
    {'<leader>lR', lsp.rename},
    {'<leader>la', "<CMD>CodeActionMenu<CR>"},
    {'<leader>lr', lsp.references},
    {'<leader>lf', lsp.formatting}
  }
}

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    server:setup {on_attach = require'virtualtypes'.on_attach}
end)


au('Filetype', {
  pattern = 'code-action-menu-*',
  callback = function()
    map {
      n = {
        {'k', 'j', {buffer = true}},
        {'l', 'k', {buffer = true}},
      }
    }
  end
})
au({'CursorHold', 'CursorHoldI'}, {
  pattern = '*',
  callback = require'nvim-lightbulb'.update_lightbulb
})

require("lsp_lines").register_lsp_virtual_lines()
