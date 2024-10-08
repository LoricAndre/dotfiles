return {
  'OXY2DEV/foldtext.nvim',
  enabled = false,
  -- lazy = false,
  event = 'Filetype',
  opts = {
    default = {
      { type = 'indent' },
      {
        type = 'raw',
        text = function(_)
          local lines = vim.api.nvim_buf_get_lines(
            0,
            vim.v.foldstart - 1,
            vim.v.foldend + 1,
            false
          )
          local offset = 1
          while lines[offset]:find('%w') == nil do
            offset = offset + 1
          end
          return lines[offset]:match('^%s*(.-)%s*$'):sub(1, 30)
        end,
        hl = 'Comment',
        gradient_repeat = true,
      },
      {
        type = 'fold_size',
        prefix = ' --- ',
        postfix = ' lines --- ',
      },
    },
  },
}
