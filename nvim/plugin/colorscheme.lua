if vim.g.colorscheme:sub(1, #'catppuccin') == 'catppuccin' then
  -- Catppuccin
  require('catppuccin').setup({
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false, -- dims the background color of inactive window
      shade = 'dark',
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { 'italic' }, -- Change the style of comments
      conditionals = { 'italic' },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    --   return {
    --     ['@comment.todo'] = { bg = c.surface2, fg = c.flamingo, style = {"bold"} }
    --   }
    -- end,
    default_integrations = false,
    integrations = {
      treesitter = true,
      fzf = true,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  })
elseif vim.g.colorscheme:sub(1, #'tokyonight') == 'tokyonight' then
  require('tokyonight').setup()
end

vim.cmd.colorscheme(vim.g.colorscheme)
