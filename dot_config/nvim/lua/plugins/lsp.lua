local setup_completion_keymaps = require("utils").setup_completion_keymaps

local mason_opts = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
  ensure_installed = {
    "autopep8",
    "blue",
    "clang-format",
    "codelldb",
    "commitlint",
    "azure-pipelines-language-server",
    "bash-language-server",
    "clangd",
    "omnisharp",
    "css-lsp",
    "dockerfile-language-server",
    "emmet-language-server",
    "eslint-lsp",
    "eslint_d",
    "markdownlint",
    "marksman",
    "netcoredbg",
    "powershell-editor-services",
    "stylua",
    "trivy",
    "gitlab-ci-ls",
    "helm-ls",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "pyright",
    "sqlls",
    "svelte-language-server",
    "tailwindcss-language-server",
    "terraform-ls",
    "typescript-language-server",
    "rust-analyzer",
    "vue-language-server",
    "yaml-language-server",
  }
}

local server_configurations = {
  {
    inlay_hints = {
      enabled = true
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/completion", { bufnr = bufnr }) then
        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
        setup_completion_keymaps(bufnr)
      end
      if client.supports_method("textDocument/inlayHint", { bufnr = bufnr }) then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end,
  }
}

local function install_servers(_, _)
  local registry = require("mason-registry")
  for _, package_name in pairs(mason_opts.ensure_installed) do
    if not registry.is_installed(package_name) then
      local package = registry.get_package(package_name)
      print("[MASON] Installing " .. package_name)
      package:install()
    end
  end
end

return {
  "williamboman/mason.nvim",
  -- after = "coq_nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim",
    {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      cond = false,
      config = function()
        vim.diagnostic.config({
          virtual_text = false,
        })
        require("lsp_lines").setup()
      end,
    }
  },
  event = "VeryLazy",
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local registry = require("mason-registry")
    local lspconfig = require("lspconfig")

    local has_coq, coq = pcall(require, "coq_nvim")
    local has_epo, epo = pcall(require, "epo")
    local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")

    mason.setup(mason_opts)

    registry.update(install_servers)

    mason_lspconfig.setup({
      automatic_installation = false,
      handlers = {
        function(server_name)
          local opts = server_configurations[server_name] or server_configurations[1] or {}
          if has_coq then
            return lspconfig[server_name].setup(coq.lsp_ensure_capabilities(opts))
          elseif has_epo then
            return lspconfig[server_name].setup(vim.tbl_deep_extend('force', opts, {
              capabilities = vim.tbl_deep_extend(
                'force',
                vim.lsp.protocol.make_client_capabilities(),
                epo.register_cap()
              )
            }))
          elseif has_cmp then
            local capabilities = cmp_lsp.default_capabilities()
            return lspconfig[server_name].setup {
              capabilities = capabilities
            }
          else
            return lspconfig[server_name].setup(opts)
          end
        end
      }
    })
  end,
  keys = {
    { "ga",         function() return vim.lsp.buf.code_action({ apply = true }) end, desc = "[LSP] Code Action" },
    { "ga",         function() return vim.lsp.buf.code_action({ apply = true }) end, mode = "v",                     desc = "[LSP] Code Action" },
    { "gn",         function() return vim.lsp.buf.rename() end,                      desc = "[LSP] Rename" },
    { "K",          function() return vim.lsp.buf.hover() end,                       desc = "[LSP] Hover" },
    { "<leader>cf", function() return vim.lsp.buf.format({ async = true }) end,      desc = "[LSP] Format" },
    { "<leader>cf", function() return vim.lsp.buf.format({ async = true }) end,      mode = "v",                     desc = "[LSP] Format" },
    { "gd",         function() return vim.lsp.buf.definition() end,                  desc = "[LSP] Definition" },
    { "gr",         function() return vim.lsp.buf.references() end,                  desc = "[LSP] References" },
    { "gs",         function() return vim.lsp.buf.document_symbol() end,             desc = "[LSP] Document symbol" },
    { "gq",         function() return vim.lsp.buf.workspace_symbol() end,            desc = "[LSP] Workspace symbol" },
    { "gi",         function() return vim.lsp.buf.implementation() end,              desc = "[LSP] Implementations" },
    { 'gl',         function() return vim.lsp.buf.incoming_calls() end,              desc = '[LSP] Incoming calls' },
    { 'gk',         function() return vim.lsp.buf.outgoing_calls() end,              desc = '[LSP] Outgoing calls' },
    { 'gm',         function() return vim.diagnostic.jump({ count = 1 }) end,        desc = '[LSP] Next diagnostic' },
    { 'gj',         function() return vim.diagnostic.jump({ count = -1 }) end,       desc = '[LSP] Prev diagnostic' },
  }
}
