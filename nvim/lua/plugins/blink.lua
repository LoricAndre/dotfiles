return {
  'saghen/blink.cmp',
  version = '*',
  opts = {
    keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      ['<C-e>'] = { 'cancel', 'fallback' },
    },
    signature = {
      enabled = true,
    },
    completion = {
      list = {
        selection = { preselect = false, auto_insert = true },
      },
      accept = {
        auto_brackets = { enabled = false },
      },
      menu = {
        draw = { treesitter = { 'lsp' } },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
    sources = {
      default = function()
        local res = { 'lsp', 'path', 'snippets', 'buffer' }
        if pcall(require, 'codecompanion') then
          res[#res + 1] = 'codecompanion'
        end
        return res
      end,
    },
  },
}
