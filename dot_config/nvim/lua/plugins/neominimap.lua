---@alias Neominimap.Config.LayoutType "split" | "float"
---@alias Neominimap.Config.MarkMode "sign" | "line"

return {
  'Isrothy/neominimap.nvim',
  lazy = false, -- NOTE: NO NEED to Lazy load
  enabled = false,
  cmd = 'Neominimap',
  version = 'v3.*.*',
  keys = {
    { '<leader>nt', '<cmd>Neominimap toggle<cr>', desc = '[minimap] toggle' },
    { '<leader>no', '<cmd>Neominimap on<cr>', desc = '[minimap] enable' },
    { '<leader>nc', '<cmd>Neominimap off<cr>', desc = '[minimap] disable' },
    { '<leader>nf', '<cmd>Neominimap focus<cr>', desc = '[minimap] focus' },
    { '<leader>nu', '<cmd>Neominimap unfocus<cr>', desc = '[minimap] unfocus' },
    {
      '<leader>ns',
      '<cmd>Neominimap toggleFocus<cr>',
      desc = '[minimap] toggle focus',
    },
    {
      '<leader>nwt',
      '<cmd>Neominimap winToggle<cr>',
      desc = '[minimap] toggle for current window',
    },
    {
      '<leader>nwr',
      '<cmd>Neominimap winRefresh<cr>',
      desc = '[minimap] refresh for current window',
    },
    {
      '<leader>nwo',
      '<cmd>Neominimap winOn<cr>',
      desc = '[minimap] enable for current window',
    },
    {
      '<leader>nwc',
      '<cmd>Neominimap winOff<cr>',
      desc = '[minimap] disable for current window',
    },
    {
      '<leader>nbt',
      '<cmd>Neominimap bufToggle<cr>',
      desc = '[minimap] toggle for current buffer',
    },
    {
      '<leader>nbr',
      '<cmd>Neominimap bufRefresh<cr>',
      desc = '[minimap] refresh for current buffer',
    },
    {
      '<leader>nbo',
      '<cmd>Neominimap bufOn<cr>',
      desc = '[minimap] enable for current buffer',
    },
    {
      '<leader>nbc',
      '<cmd>Neominimap bufOff<cr>',
      desc = '[minimap] disable for current buffer',
    },
  },
  init = function()
    vim.g.neominimap = {
      -- Enable the plugin by default
      auto_enable = false, ---@type boolean

      -- Log level
      log_level = vim.log.levels.TRACE, ---@type integer

      -- Notification level
      notification_level = vim.log.levels.TRACE, ---@type integer

      -- Path to the log file
      log_path = vim.fn.stdpath('data') .. '/neominimap.log', ---@type string

      -- Minimap will not be created for buffers of these types
      ---@type string[]
      exclude_filetypes = {
        'help',
        -- "neo-tree"
      },

      -- Minimap will not be created for buffers of these types
      ---@type string[]
      exclude_buftypes = {
        -- "nofile",
        -- "nowrite",
        -- "quickfix",
        -- "terminal",
        -- "prompt",
      },

      -- When false is returned, the minimap will not be created for this buffer
      ---@type fun(bufnr: integer): boolean
      buf_filter = function() return true end,

      -- When false is returned, the minimap will not be created for this window
      ---@type fun(winid: integer): boolean
      win_filter = function(winid) return winid ~= nil end,

      -- How many columns a dot should span
      x_multiplier = 4, ---@type integer

      -- How many rows a dot should span
      y_multiplier = 1, ---@type integer

      --- Either `split` or `float`
      --- When layout is set to `float`,
      --- the minimap will be created in floating windows attached to all suitable windows
      --- When layout is set to `split`,
      --- the minimap will be created in one split window
      layout = 'split', ---@type Neominimap.Config.LayoutType

      --- Used when `layout` is set to `split`
      split = {
        minimap_width = 20, ---@type integer
      },

      -- For performance issue, when text changed,
      -- minimap is refreshed after a certain delay
      -- Set the delay in milliseconds
      delay = 200, ---@type integer

      -- Sync the cursor position with the minimap
      sync_cursor = true, ---@type boolean

      click = {
        -- Enable mouse click on minimap
        enabled = true, ---@type boolean
        -- Automatically switch focus to minimap when clicked
        auto_switch_focus = false, ---@type boolean
      },

      diagnostic = {
        enabled = true, ---@type boolean
        severity = vim.diagnostic.severity.WARN, ---@type integer
        mode = 'sign', ---@type Neominimap.Handler.MarkMode
        priority = {
          ERROR = 100, ---@type integer
          WARN = 90, ---@type integer
          INFO = 80, ---@type integer
          HINT = 70, ---@type integer
        },
      },

      git = {
        enabled = true, ---@type boolean
        mode = 'sign', ---@type Neominimap.Handler.MarkMode
        priority = 6, ---@type integer
      },

      search = {
        enabled = true, ---@type boolean
        mode = 'sign', ---@type Neominimap.Handler.MarkMode
        priority = 120, ---@type integer
      },

      treesitter = {
        enabled = true, ---@type boolean
        priority = 10, ---@type integer
      },

      fold = {
        -- Considering fold when rendering minimap
        enabled = true, ---@type boolean
      },

      ---Overrite the default winopt
      ---@param opt vim.wo
      ---@param winid integer the window id of the source window, NOT minimap window
      winopt = function(opt, winid) end,

      ---Overrite the default bufopt
      ---@param opt vim.bo
      ---@param bufnr integer the buffer id of the source buffer, NOT minimap buffer
      bufopt = function(opt, bufnr) end,
    }
  end,
}
