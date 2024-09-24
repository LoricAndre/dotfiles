return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = function()
    local has_cmp, cmp = pcall(require, 'cmp')

    if has_cmp then
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
    local opts = {}
    return require('nvim-autopairs').setup(opts)
  end,
}
