local trigger = '<F11>'
return {
  'folke/edgy.nvim',
  event = 'VeryLazy',
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = 'screen'
  end,
  config = function(_, opts)
    require('edgy').setup(opts)
    local aug = vim.api.nvim_create_augroup('edgy-autoopen-custom', {clear = true})
    vim.api.nvim_create_autocmd('LspAttach', {
      group = aug,
      pattern = '*',
      callback = function()
        require('edgy').open()
        vim.defer_fn(require('edgy').goto_main, 100)
      end
    })
  end,
  keys = {
    {
      trigger,
      function()
        require('edgy').toggle()
        vim.defer_fn(require('edgy').goto_main, 100)
      end,
      desc = '[edgy] toggle',
    },
  },
  opts = {
    exit_when_last = true,
    bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
      {
        title = 'toggleterm',
        ft = 'toggleterm',
        size = { height = 0.25 },
        -- exclude floating windows
        filter = function(buf, win)
          local spawned_by_overseer, _ =
            pcall(vim.api.nvim_buf_get_var, buf, 'overseer_task')
          local is_tiled = vim.api.nvim_win_get_config(win).relative == ''
          return is_tiled and not spawned_by_overseer
        end,
        pinned = true,
        open = 'ToggleTerm',
      },
      'Trouble',
      { ft = 'qf', title = 'QuickFix' },
      {
        ft = 'help',
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf) return vim.bo[buf].buftype == 'help' end,
      },
      { ft = 'spectre_panel', size = { height = 0.4 } },
    },
    left = {
      -- Neo-tree filesystem always takes half the screen height
      {
        title = 'neotree',
        ft = 'neo-tree',
        pinned = true,
        size = { height = 0.7 },
        open = 'Neotree',
      },
    },
    right = {
      -- {
      --   title = "minimap",
      --   ft = "neominimap",
      --   pinned = true,
      --   open = "Neominimap on",
      --   size = {
      --     width = 0.2
      --   }
      -- }
      {
        title = 'outline',
        ft = 'Outline',
        pinned = true,
        open = 'OutlineOpen!',
        -- size = { width = 0.2 }
      },
      {
        title = 'overseer',
        ft = 'OverseerList',
        pinned = true,
        open = 'OverseerOpen',
        size = { height = 0.25 },
      },
      {
        title = 'toggleterm',
        ft = 'toggleterm',
        size = { height = 0.25 },
        -- exclude floating windows
        filter = function(buf, win)
          local spawned_by_overseer, _ =
            pcall(vim.api.nvim_buf_get_var, buf, 'overseer_task')
          local is_tiled = vim.api.nvim_win_get_config(win).relative == ''
          return is_tiled and spawned_by_overseer
        end,
      },
    },
    animate = {
      enabled = false,
      fps = 60, -- frames per second
      cps = 120, -- cells per second
      on_begin = function() vim.g.minianimate_disable = true end,
      on_end = function() vim.g.minianimate_disable = false end,
      -- Spinner for pinned views that are loading.
      -- if you have noice.nvim installed, you can use any spinner from it, like:
      -- spinner = require("noice.util.spinners").spinners.circleFull,
      spinner = {
        frames = {
          '⠋',
          '⠙',
          '⠹',
          '⠸',
          '⠼',
          '⠴',
          '⠦',
          '⠧',
          '⠇',
          '⠏',
        },
        interval = 80,
      },
    },
  },
}
