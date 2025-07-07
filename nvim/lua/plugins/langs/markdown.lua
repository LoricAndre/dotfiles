return {
  {
    'OXY2DEV/markview.nvim',
    enabled = true,
    submodules = false,
    ft = { 'markdown', 'codecompanion', 'avante' },
    opts = {
      preview = { filetypes = { 'markdown', 'codecompanion', 'avante' } },
    },
  },
  {
    'sotte/presenting.nvim',
    opts = {
      options = {
        width = 150
      },
      separator = {
        markdown = '^---$'
      },
      keep_separator = false,
      keymaps = {
        ['h'] = function() require('presenting').prev() end,
        ['l'] = function() require('presenting').next() end,
        ['k'] = function() require('presenting').prev() end,
        ['j'] = function() require('presenting').next() end,
        ['<Up>'] = function() require('presenting').prev() end,
        ['<Down>'] = function() require('presenting').next() end,
        ['<Left>'] = function() require('presenting').prev() end,
        ['<Right>'] = function() require('presenting').next() end,
      }
    },
    cmd = { 'Presenting' },
    config = function(_, opts)
      local presenting = require('presenting')
      local aug = vim.api.nvim_create_augroup('custom_presenting', { clear = true })
      vim.api.nvim_create_autocmd('BufWinEnter', {
        group = aug,
        callback = function(ev)
          local is_presenting = presenting._state ~= nil
          local has_kitty = pcall(vim.fn.system, 'kitty --version')
          local in_kitty = vim.fn.expand('$KITTY_LISTEN_ON') ~= nil
          if is_presenting and has_kitty and in_kitty then
            vim.fn.system('kitty @ --to $KITTY_LISTEN_ON set-font-size 18')
            vim.api.nvim_create_autocmd('BufLeave', {
              group = aug,
              once = true,
              buffer = ev.buf,
              callback = function()
                vim.fn.system('kitty @ --to $KITTY_LISTEN_ON set-font-size ' .. vim.g.fontsize)
              end
            })
          end
        end
      })
      return presenting.setup(opts)
    end
  }
}
