require('blink.cmp').setup({
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
      keyword = {
        range = 'full',
      },
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
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
})
