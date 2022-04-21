local vim = vim
local map = require'utils'.map

map {
  n = {
    {'<leader>os', require'sidebar-nvim'.toggle}
  }
}

local azertySidebarMappingsAutocmd = function()
  map {
    n = {
      {'j', 'h', {buffer = true}},
      {'k', 'j', {buffer = true}},
      {'l', 'k', {buffer = true}},
      {'m', 'l', {buffer = true}}
    }
  }
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'SidebarNvim',
  callback = azertySidebarMappingsAutocmd
})

-- vim.api.nvim_set_hl(0, 'SidebarNvimBuffersActive', vim.api.nvim_get_hl_by_name('diffAdded', true))

require'sidebar-nvim'.setup {
  open = true,
  position = 'right',
  hide_statusline = true,
  sections = {
    "buffers",
    "files",
    "diagnostics",
    "todos",
  },
  buffers = {
    icon = "",
    ignored_buffers = {".*oneterm.*"}, -- ignore buffers by regex
    sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
    show_numbers = true, -- whether to also show the buffer numbers
  },
  git = {
    icon = "",
    ignored_buffers = {}, -- ignore buffers by regex
    sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
    show_numbers = true, -- whether to also show the buffer numbers
  },
}
