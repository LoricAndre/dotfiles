local nmap = require 'utils'.nmap
local servers = {
  'sumneko_lua',
  'bashls',
  'pyright',
  'clangd',
  'rust_analyzer',
  'gopls',
  'tsserver',
}

local on_attach = function()
  require('lsp_lines').register_lsp_virtual_lines()
  require 'virtualtypes'.on_attach()
  nmap { 'K', vim.lsp.buf.hover }
  nmap { '<leader>ld', vim.lsp.buf.definition }
  nmap { '<leader>lD', vim.lsp.buf.declaration }
  nmap { '<leader>li', vim.lsp.buf.implementation }
  nmap { '<leader>lt', vim.lsp.buf.type_definition }
  nmap { '<leader>lr', vim.lsp.buf.references }
  nmap { '<leader>lR', vim.lsp.buf.rename }
  nmap { '<leader>ls', vim.lsp.buf.document_symbol }
  nmap { '<leader>lS', vim.lsp.buf.workspace_symbol }
  nmap { '<leader>la', vim.lsp.buf.code_action }
  nmap { '<leader>lf', function() vim.lsp.buf.format { async = true } end }
end

require 'nvim-lsp-installer'.setup {
  automatic_installation = true
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, server in ipairs(servers) do
  require 'lspconfig'[server].setup {
    on_attach = on_attach,
    capabilities = capabilities
  }
end
