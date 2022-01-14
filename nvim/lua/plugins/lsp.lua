local maps = require'nest'.applyKeymaps
local m = require'mappings.constants'
local lsp = vim.lsp.buf

maps {
  {mode = 'n', {
    {'<leader>', {
      {m.l, {
        {m.d, lsp.definition},
        {m.D, lsp.declaration},
        {m.K, lsp.hover},
        {m.i, lsp.implementation},
        {m.s, lsp.signature_help},
        {m.t, lsp.type_definition},
        {m.R, lsp.rename},
        -- {m.a, lsp.code_action},
        {m.a, "<CMD>CodeActionMenu<CR>"},
        {m.r, lsp.references},
        {m.f, lsp.formatting}
      }}
    }}
  }}
}

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    server:setup {on_attach = require'virtualtypes'.on_attach}
end)

vim.cmd [[
  augroup codeActionMenu
    au!
    au Filetype code-action-menu-* nnoremap k j
    au Filetype code-action-menu-* nnoremap l k
  augroup end
  augroup lightbulb
    au!
    autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
  augroup end
]]
