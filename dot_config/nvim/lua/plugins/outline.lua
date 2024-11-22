return {
  'hedyhli/outline.nvim',
  cmd = { 'Outline', 'OutlineOpen' },
  keys = {
    { '<leader>o', '<cmd>Outline<CR>', desc = '[outline] toggle' },
  },
  opts = {
    keymaps = {
      -- toggle_preview = 'L',
      rename_symbol = 'r',
      code_actions = 'a',
      -- fold = 'j',
      -- unfold = 'm',
      -- down_and_jump = 'K',
      -- up_and_jump = 'L',
    },
  },
}
