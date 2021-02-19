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
  -- -- JDTLS
  -- local configs = require'lspconfig/configs'
  -- -- Check if it's already defined for when reloading this file.
  -- if not lsp.jls then
  --   configs.jls = {
  --     default_config = {
  --       cmd = {'jdtls'};
  --       filetypes = {'java'};
  --       root_dir = function(fname)
  --         return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
  --       end;
  --       settings = {};
  --     };
  --   }
  -- end
  -- lsp.jls.setup{}

  -- map('n', '<leader>lD', '<cmd>silent! lua vim.lsp.buf.declaration()<CR>', {})
  -- map('n', '<leader>ld', '<cmd>silent! lua vim.lsp.buf.definition()<CR>', {})
  -- map('n', '<leader>lk', '<cmd>silent! lua vim.lsp.buf.hover()<CR>', {})
  map('n', '<leader>li', '<cmd>silent! lua vim.lsp.buf.implementation()<CR>', {})
  map('n', '<leader>lS', '<cmd>silent! lua vim.lsp.buf.signature_help()<CR>', {})
  map('n', '<leader>lt', '<cmd>silent! lua vim.lsp.buf.type_definition()<CR>', {})
  -- map('n', '<leader>lr', '<cmd>silent! lua vim.lsp.buf.references()<CR>', {})
  -- map('n', '<leader>la', '<cmd>silent! lua vim.lsp.buf.code_action()<CR>', {})
  -- map('n', '<leader>lf', '<cmd>silent! lua vim.lsp.buf.formatting()<CR>', {})
  -- map('n', '<leader>ls', '<cmd>silent! lua vim.lsp.buf.document_symbol()<CR>', {})
  map('n', '<leader>lw', '<cmd>silent! lua vim.lsp.buf.workspace_symbol()<CR>', {})
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

M.jdtls = function()
  au("FileType", "java", [[lua require('jdtls').start_or_attach({
    cmd = {'java-lsp.sh'},
    init_options = {
      bundles = {
        vim.fn.glob("~/dotfiles/deps/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
      }
    }
  })]])
  au("fileType", "java", "lua require('jdtls').setup_dap()")
  local jdtls_ui = require'jdtls.ui'
  function jdtls_ui.pick_one_async(items, _, _, cb)
    require'lsputil.codeAction'.code_action_handler(nil, nil, items, nil, nil, nil, cb)
  end
end

M.utils = function()
  vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
  vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
  vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
  vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
  vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
  vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
  vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
  vim.g.lsp_utils_location_opts = {
    keymaps = {
      n = {
        ['k'] = '<Down>',
        ['l'] = '<Up>',
        ['m'] = '<CR>',
        ['j'] = 'q'
      }
    },
    mode = 'editor',
    prompt = nil -- {} -- for prompt
  }
  vim.g.lsp_utils_symbols_opts = vim.g.lsp_utils_location_opts
  vim.g.lsp_utils_codeaction_opts = vim.g.lsp_utils_location_opts
end

M.saga = function()
  local saga = require'lspsaga'
  saga.init_lsp_saga {
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10, -- preview lines of lsp_finder aefinition preview
    finder_action_keys = {
      open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
    },
    code_action_keys = {
      quit = '<Esc>',exec = '<CR>'
    },
    rename_action_keys = {
      quit = '<Esc>',exec = '<CR>'  -- quit can be a table
    },
    definition_preview_icon = '  ',
    border_style = 1,
    rename_prompt_prefix = '➤',
  }

  map('n', '<leader>lf', ':Lspsaga lsp_finder<CR>', {noremap = true, silent = true})
  map('n', '<leader>la', ':Lspsaga code_action<CR>', {noremap = true, silent = true})
  map('n', '<leader>lk', ':Lspsaga hover_doc<CR>', {noremap = true, silent = true})
  map('n', '<leader>ls', ':Lspsaga signature_help<CR>', {noremap = true, silent = true})
  map('n', '<leader>lr', ':Lspsaga rename<CR>', {noremap = true, silent = true})
  map('n', '<leader>ld', ':Lspsaga preview_definition<CR>', {noremap = true, silent = true})
  map('n', '<leader>lD', ':Lspsaga show_line_diagnostics<CR>', {noremap = true, silent = true})
  map('n', '<leader>t', ':Lspsaga open_floaterm<CR>', {noremap = true, silent = true})
  map('t', '<C-d>', '<C-\\><C-n>:Lspsaga close_floaterm<CR>', {noremap = true, silent = true})
end

return M
