local mason_opts = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",

      package_uninstalled = "✗"

    }
  }
}

local lsp_handlers = {}

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
    local lspconfig = require("lspconfig")

    local has_coq, coq = pcall(require, "coq_nvim")
    local has_epo, epo = pcall(require, "epo")
    local has_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")

    mason.setup(mason_opts)
    mason_lspconfig.setup()

    mason_lspconfig.setup_handlers({
      function(server_name)
        local opts = lsp_handlers[server_name] or {}
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
    })
  end,
  keys = {
    { "ga",  function() return vim.lsp.buf.code_action({ apply = true }) end, desc = "[LSP] Code Action" },
    { "ga",  function() return vim.lsp.buf.code_action({ apply = true }) end, mode = "v",                   desc = "[LSP] Code Action" },
    { "gn",  function() return vim.lsp.buf.rename() end,                      desc = "[LSP] Rename" },
    { "K",           function() return vim.lsp.buf.hover() end,                       desc = "[LSP] Hover" },
    { "<leader>cf",  function() return vim.lsp.buf.format({ async = true }) end,      desc = "[LSP] Format" },
    { "<leader>cf",  function() return vim.lsp.buf.format({ async = true }) end,      mode = "v",                   desc = "[LSP] Format" },
    { "gd",  function() return vim.lsp.buf.definition() end,                   desc = "[LSP] Definition" },
    { "gr",  function() return vim.lsp.buf.references() end,                   desc = "[LSP] References" },
    { "gs",  function() return vim.lsp.buf.document_symbol() end,                   desc = "[LSP] Document symbol" },
    { "gq",  function() return vim.lsp.buf.workspace_symbol() end,                   desc = "[LSP] Workspace symbol" },
    { "gi",  function() return vim.lsp.buf.implementation() end,                   desc = "[LSP] Implementations" },
    { 'gl', function() return vim.lsp.buf.incoming_calls() end,              desc = '[LSP] Incoming calls' },
    { 'gk', function() return vim.lsp.buf.outgoing_calls() end,              desc = '[LSP] Outgoing calls' },
    { 'gm', function() return vim.diagnostic.goto_next() end,              desc = '[LSP] Next diagnostic' },
    { 'gj', function() return vim.diagnostic.goto_prev() end,              desc = '[LSP] Prev diagnostic' },

  }
}
