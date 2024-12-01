return {
  'ibhagwan/fzf-lua',
  event = 'VeryLazy',
  dependencies = { { 'nvim-tree/nvim-web-devicons', lazy = true } },
  enabled = require('settings').finder == 'fzf',
  config = function()
    local fzf = require('fzf-lua')
    fzf.setup({
      debug = true,
      desc = 'skim run inside a tmux popup',
      fzf_bin = 'sk',
      -- fzf_opts = { ['--tmux'] = "80%,60%" },
      fzf_tmux_opts = {},
      winopts = {
        -- preview = { default = 'bat' },
        height = 0.7,
        width = 0.6,
        row = 0.5,
        col = 0.5,
        backdrop = 100,
      },
      manpages = { previewer = 'man_native' },
      helptags = { previewer = 'help_native' },
      lsp = { code_actions = { previewer = 'codeaction_native' } },
      tags = { previewer = 'bat' },
      btags = { previewer = 'bat' },
    })
    fzf.register_ui_select()
    local lsp_handlers = {
      ['textDocument/references'] = fzf.lsp_references,
      ['textDocument/definition'] = fzf.lsp_definition,
      ['textDocument/documentSymbol'] = fzf.lsp_document_symbols,
      ['workspace/symbol'] = fzf.lsp_live_workspace_symbols,
      ['textDocument/codeAction'] = fzf.lsp_code_actions,
      ['callHierarchy/incomingCalls'] = fzf.lsp_incoming_calls,
      ['callHierarchy/outgoingCalls'] = fzf.lsp_outgoing_calls,
      ['textDocument/declaration'] = fzf.lsp_declarations,
      ['textDocument/implementation'] = fzf.lsp_implementations,
    }
    for k, v in pairs(lsp_handlers) do
      vim.lsp.handlers[k] = v
    end
  end,
  keys = { -- TODO :
    {
      '<leader>a',
      function() require('fzf-lua').grep_project() end,
      noremap = true,
      desc = '[FZF] Search',
    },
    {
      '<leader>f',
      function() require('fzf-lua').files() end,
      noremap = true,
      desc = '[FZF] Files',
    },
    {
      '<leader>b',
      function() require('fzf-lua').buffers() end,
      noremap = true,
      desc = '[FZF] Buffers',
    },
    {
      'gw',
      function() require('fzf-lua').diagnostics_document() end,
      noremap = true,
      desc = '[LSP] Document diagnostics',
    },
    {
      'gW',
      function() require('fzf-lua').diagnostics_workspace() end,
      noremap = true,
      desc = '[LSP] Workspace diagnostics',
    },
  },
}
