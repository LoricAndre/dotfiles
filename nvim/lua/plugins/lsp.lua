local vim = vim
require'utils'

M = {}
M.lsp = function()
  local lsp = require'lspconfig'
  lsp.clangd.setup{}
  lsp.cmake.setup{}
  lsp.html.setup{}
  lsp.jedi_language_server.setup{}
  lsp.jsonls.setup{}
  lsp.texlab.setup{}
  lsp.vimls.setup{}
  lsp.vuels.setup{}
  lsp.tsserver.setup{}
  lsp.sumneko_lua.setup{
    cmd = {"lua-language-server"}
  }
  lsp.rust_analyzer.setup{}
  lsp.bashls.setup{
    filetypes = {"sh", "bash", "zsh"}
  }
  -- JDTLS
  local configs = require'lspconfig/configs'
  -- Check if it's already defined for when reloading this file.
  if not lsp.jls then
    configs.jls = {
      default_config = {
        cmd = {'jdtls'};
        filetypes = {'java'};
        root_dir = function(fname)
          return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
        end;
        settings = {};
      };
    }
  end
  lsp.jls.setup{}

  map('n', '<leader>lD', '<cmd>silent! lua vim.lsp.buf.declaration()<CR>', {})
  map('n', '<leader>ld', '<cmd>silent! lua vim.lsp.buf.definition()<CR>', {})
  map('n', '<leader>lk', '<cmd>silent! lua vim.lsp.buf.hover()<CR>', {})
  map('n', '<leader>li', '<cmd>silent! lua vim.lsp.buf.implementation()<CR>', {})
  map('n', '<leader>lS', '<cmd>silent! lua vim.lsp.buf.signature_help()<CR>', {})
  map('n', '<leader>lt', '<cmd>silent! lua vim.lsp.buf.type_definition()<CR>', {})
  map('n', '<leader>lr', '<cmd>silent! lua vim.lsp.buf.references()<CR>', {})
  map('n', '<leader>la', '<cmd>silent! lua vim.lsp.buf.code_action()<CR>', {})
  map('n', '<leader>lf', '<cmd>silent! lua vim.lsp.buf.formatting()<CR>', {})
  -- Diags
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        spacing = 2,
        prefix = ''
      },
      signs = true,
    }
  )
  vim.cmd("sign define LspDiagnosticsSignError text= texthl=LspDiagnosticsSignError linehl= numhl=")
  vim.cmd("sign define LspDiagnosticsSignWarning text= texthl=LspDiagnosticsSignWarning linehl= numhl=")
  vim.cmd("sign define LspDiagnosticsSignInformation text= texthl=LspDiagnosticsSignInformation linehl= numhl=")
  vim.cmd("sign define LspDiagnosticsSignHint text=H texthl=LspDiagnosticsSignHint linehl= numhl=")
end
return M
