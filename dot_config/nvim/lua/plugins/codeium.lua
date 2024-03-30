return {
  'Exafunction/codeium.vim',
  enabled = false,
  event = "VeryLazy",
  keys = {
    { '<Tab>', function () return vim.fn['codeium#Accept']() end, expr = true , mode = 'i' },
    { '<c-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, expr = true , mode = 'i' },
    { '<c-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, expr = true, mode = 'i' },
    { '<c-x>', function() return vim.fn['codeium#Clear']() end, expr = true, mode = 'i' },
  }
}
