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
    { 'neovim/nvim-lspconfig',   lazy = true },
    { 'neovim/nvim-lspconfig',   lazy = true },
  },
  event = 'FileType',
  config = function()
    local has_blink, blink = pcall(require, 'blink.cmp')
    local has_coq, coq = pcall(require, 'coq')
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    if has_blink then
      capabilities = blink.get_lsp_capabilities(capabilities)
    elseif has_coq then
      capabilities = coq.lsp_ensure_capabilities(capabilities)
    end
    vim.lsp.config('*', {
      capabilities = capabilities,
    })

    require('mason').setup()
    ---@diagnostic disable-next-line: missing-fields
    require('mason-lspconfig').setup({
      ensure_installed = build_servers_to_install(),
    })

    local aug = vim.api.nvim_create_augroup('custom_lsp', { clear = true })
    vim.api.nvim_create_autocmd('LspAttach', {
      group = aug,
      callback = function(ev)
        local bufnr = ev.buf
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
          vim.notify('Failed to setup client attach cb', vim.log.levels.WARN)
          return
        end
        if client:supports_method('textDocument/diagnostic') then
          vim.keymap.set({ 'n', 'v' }, 'gh', function()
            vim.diagnostic.jump({ count = -1, float = true })
          end, { desc = '[lsp] jump to previous diagnostic' })
          vim.keymap.set({ 'n', 'v' }, 'gl', function()
            vim.diagnostic.jump({ count = 1, float = true })
          end, { desc = '[lsp] jump to next diagnostic' })
        end
        if client:supports_method('textDocument/rename') then
          vim.keymap.set({ 'n' }, '<leader>cn', function()
            vim.lsp.buf.rename()
          end, { desc = '[lsp] rename' })
        end
        if client:supports_method('textDocument/formatting') then
          vim.g.autoformat = true
          vim.keymap.set('n', '<leader>cf', function()
            vim.lsp.buf.format({ async = true, id = client.id, bufnr = bufnr })
          end, { desc = '[lsp] format' })
          if client:supports_method('textDocument/rangeFormatting') then
            vim.keymap.set('v', '<leader>cf', function()
              vim.lsp.buf.format({ async = true, id = client.id, bufnr = bufnr })
            end, { desc = '[lsp] format' })
          end
          if not client:supports_method('textDocument/willSaveWaitUntil') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = aug,
              buffer = bufnr,
              callback = function()
                if vim.g.autoformat or false then
                  vim.lsp.buf.format({
                    bufnr = bufnr,
                    id = client.id,
                    timeout_ms = 1000,
                  })
                end
              end,
            })
          end
        end
        if client:supports_method('textDocument/definition') then
          vim.keymap.set({ 'n' }, '<leader>cd', function()
            vim.lsp.buf.definition({ reuse_win = true })
          end, { desc = '[lsp] definition' })
        end
        if client:supports_method('textDocument/declaration') then
          vim.keymap.set({ 'n' }, '<leader>cD', function()
            vim.lsp.buf.declaration({ reuse_win = true })
          end, { desc = '[lsp] declaration' })
        end
        if client:supports_method('textDocument/typeDefinition') then
          vim.keymap.set({ 'n' }, '<leader>ct', function()
            vim.lsp.buf.type_definition({ reuse_win = true })
          end, { desc = '[lsp] type definition' })
        end
        if client:supports_method('textDocument/implementation') then
          vim.keymap.set({ 'n' }, '<leader>ci', function()
            vim.lsp.buf.implementation({ reuse_win = true })
          end, { desc = '[lsp] implementation' })
        end
        if client:supports_method('workspace/diagnostic') then
          vim.keymap.set({ 'n' }, '<leader>ce', function()
            vim.diagnostic.setqflist()
          end, { desc = '[lsp] diagnostics' })
        end
        if
            client:supports_method('textDocument/documentColor')
            and vim.lsp.document_color ~= nil
        then
          vim.lsp.document_color.enable(true, bufnr, {
            style = 'virtual',
          })
        end
      end,
    })
  end,
}
