local servers = {
  ansible = 'ansiblels',
  bash = 'bashls',
  cs = 'omnisharp',
  c = 'clangd',
  cpp = 'clangd',
  cmake = 'neocmake',
  docker = { 'docker_compose_language_service', 'dockerls' },
  go = 'gopls',
  helm = 'helm_ls',
  javascript = { 'ts_ls', 'eslint' },
  json = 'jsonls',
  lua = 'lua_ls',
  python = { 'ruff', 'basedpyright' },
  rust = 'rust_analyzer',
  terraform = 'terraformls',
  yaml = { 'yamlls', 'gitlab_ci_ls' },
}
local function build_servers_to_install()
  local res = {}
  for _, server in pairs(servers) do
    if type(server) == 'table' then
      for _, s in ipairs(server) do
        table.insert(res, s)
      end
    elseif type(server) == 'string' then
      table.insert(res, server)
    end
  end
  return res
end

return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    { 'williamboman/mason.nvim', lazy = true },
    { 'neovim/nvim-lspconfig', lazy = true },
    { 'neovim/nvim-lspconfig', lazy = true },
  },
  event = 'FileType',
  opts = {
    ensure_installed = build_servers_to_install(),
    handlers = {
      function(server)
        local has_blink, blink = pcall(require, 'blink.cmp')
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        if has_blink then
          capabilities = blink.get_lsp_capabilities(capabilities)
        end
        return require('lspconfig')[server].setup({
          on_attach = function(client, bufnr)
            vim.keymap.set({ 'n', 'v' }, 'gh', function()
              vim.diagnostic.jump({ count = -1, float = true })
            end)
            vim.keymap.set({ 'n', 'v' }, 'gl', function()
              vim.diagnostic.jump({ count = 1, float = true })
            end)
            -- vim.keymap.set({ 'n', 'v' }, '<leader>cf', function() vim.lsp.buf.format({async = true, id = client, bufnr = bufnr}) end)
          end,
          capabilities = capabilities,
        })
      end,
    },
  },
  config = function(_, opts)
    require('mason').setup()
    require('mason-lspconfig').setup(opts)
  end,
}
