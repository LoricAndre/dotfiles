local setup_completion_keymaps = require('utils.lsp').setup_completion_keymaps
local show_complete_documentation =
  require('utils.lsp').show_complete_documentation
local settings = require('settings')

local signs = { Error = "󱐋", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local server_configurations = {
  {
    inlay_hints = {
      enabled = true,
    },
    on_attach = function(client, bufnr)
      if settings.completion == 'builtin' then
        if
          client.supports_method('textDocument/completion', { bufnr = bufnr })
        then
          vim.lsp.completion.enable(
            true,
            client.id,
            bufnr,
            { autotrigger = true }
          )
          setup_completion_keymaps(bufnr)
          show_complete_documentation(client, bufnr)
        end
        if
          client.supports_method('textDocument/inlayHint', { bufnr = bufnr })
        then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end
      local has_lsp_signature, lsp_signature = pcall(require, 'lsp_signature')
      if has_lsp_signature then lsp_signature.on_attach({}, bufnr) end
      local has_tiny_code_action, tiny_code_action =
        pcall(require, 'tiny-code-action')
      if has_tiny_code_action then
        vim.lsp.handlers['textDocument/codeAction'] =
          tiny_code_action.code_action
      end
    end,
  },
}

return {
  { 'neovim/nvim-lspconfig', lazy = true },
  -- "ray-x/lsp_signature.nvim",
  {
    'linrongbin16/lsp-progress.nvim',
    opts = {
      format = function(messages)
        local active_clients = vim.lsp.get_clients()
        local client_count = #active_clients
        if #messages > 0 then
          return ' LSP:'
            .. client_count
            .. ' '
            .. table.concat(messages, ' ')
        end
        if #active_clients <= 0 then
          return ' LSP:' .. client_count
        else
          local client_names = {}
          for _, client in ipairs(active_clients) do
            if client and client.name ~= '' then
              table.insert(client_names, '[' .. client.name .. ']')
            end
          end
          return ' LSP:'
            .. client_count
            .. ' '
            .. table.concat(client_names, ' ')
        end
      end,
    },
    event = 'LspAttach',
  },
  {
    'rachartier/tiny-code-action.nvim',
    enabled = settings.finder == 'telescope',
    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true },
      { 'nvim-telescope/telescope.nvim', lazy = true },
    },
    event = 'LspAttach',
    opts = {},
  },
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach',
    init = function() vim.diagnostic.config({ virtual_text = false }) end,
    opts = {},
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    enabled = false,
    event = 'LspAttach',
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
      })
      require('lsp_lines').setup()
    end,
    lazy = true,
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
    keys = {
      {
        'ga',
        function() return vim.lsp.buf.code_action({ apply = true }) end,
        desc = '[LSP] Code Action',
      },
      {
        'ga',
        function() return vim.lsp.buf.code_action({ apply = true }) end,
        mode = 'v',
        desc = '[LSP] Code Action',
      },
      {
        'gn',
        function() return vim.lsp.buf.rename() end,
        desc = '[LSP] Rename',
      },
      {
        'K',
        function() return vim.lsp.buf.hover() end,
        desc = '[LSP] Hover',
      },
      -- { "gf", function() return vim.lsp.buf.format({ async = true }) end,      desc = "[LSP] Format" },
      {
        'gf',
        function() return vim.lsp.buf.format({ async = true }) end,
        mode = 'v',
        desc = '[LSP] Format',
      },
      {
        'gd',
        function() return vim.lsp.buf.definition() end,
        desc = '[LSP] Definition',
      },
      {
        'gr',
        function() return vim.lsp.buf.references() end,
        desc = '[LSP] References',
      },
      {
        'gs',
        function() return vim.lsp.buf.document_symbol() end,
        desc = '[LSP] Document symbol',
      },
      {
        'gq',
        function() return vim.lsp.buf.workspace_symbol() end,
        desc = '[LSP] Workspace symbol',
      },
      {
        'gi',
        function() return vim.lsp.buf.implementation() end,
        desc = '[LSP] Implementations',
      },
      {
        'gj',
        function() return vim.lsp.buf.incoming_calls() end,
        desc = '[LSP] Incoming calls',
      },
      {
        'gk',
        function() return vim.lsp.buf.outgoing_calls() end,
        desc = '[LSP] Outgoing calls',
      },
      {
        'gl',
        function() return vim.diagnostic.jump({ count = 1 }) end,
        desc = '[LSP] Next diagnostic',
      },
      {
        'gh',
        function() return vim.diagnostic.jump({ count = -1 }) end,
        desc = '[LSP] Prev diagnostic',
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    after = {
      'mason.nvim',
    },
    event = 'Filetype',
    opts = {
      ensure_installed = {
        'azure_pipelines_ls',
        'bashls',
        'clangd',
        'cssls',
        'dockerls',
        'docker_compose_language_service',
        'gitlab_ci_ls',
        'helm_ls',
        'html',
        'jsonls',
        'lua_ls',
        'marksman',
        'omnisharp',
        'pyright',
        'rust_analyzer',
        'sqlls',
        'svelte',
        'tailwindcss',
        'terraformls',
        'ts_ls',
        'yamlls',
      },
      automatic_installation = false,
      handlers = {
        function(server_name)
          local lspconfig = require('lspconfig')

          -- completion
          -- coq
          local has_coq = settings.completion == 'coq'
          if has_coq then
            ---@diagnostic disable-next-line: lowercase-global
            has_coq, coq = pcall(require, 'coq_nvim')
          end

          -- epo
          local has_epo = settings.completion == 'epo'
          if has_epo then
            ---@diagnostic disable-next-line: lowercase-global
            has_epo, epo = pcall(require, 'epo')
          end

          -- cmp
          local has_cmp = settings.completion == 'cmp'
          if has_cmp then
            ---@diagnostic disable-next-line: lowercase-global
            has_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
          end

          local opts = server_configurations[server_name]
            or server_configurations[1]
            or {}

          if has_coq then
            return lspconfig[server_name].setup(
              coq.lsp_ensure_capabilities(opts)
            )
          elseif has_epo then
            return lspconfig[server_name].setup(
              vim.tbl_deep_extend('force', opts, {
                capabilities = vim.tbl_deep_extend(
                  'force',
                  vim.lsp.protocol.make_client_capabilities(),
                  epo.register_cap()
                ),
              })
            )
          elseif has_cmp then
            local capabilities = cmp_lsp.default_capabilities()
            return lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          else
            return lspconfig[server_name].setup(opts)
          end
        end,
      },
    },
  },
}
