return {
  'saghen/blink.cmp',
  opts = {
    keymap = {
      preset = 'enter',
      ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      ['<C-e>'] = { 'cancel', 'fallback' },
    },
    completion = {
      list = {
        selection = 'auto_insert',
      },
    },
    accept = {
      auto_brackets = { enabled = false },
    },
  },
}
