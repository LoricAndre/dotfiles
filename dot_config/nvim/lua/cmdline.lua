local Popup = require('nui.popup')
local Layout = require('nui.layout')

local opts = {}
local state = {}

local layout = Layout(
  {
    position = '50%',
    size = {
      width = '30%',
      height = 1,
    },
  },
  Layout.Box({
    Popup({
      enter = true,
    }),
  })
)

local function setup()
  local ns = vim.api.nvim_create_namespace('custom-cmdline')
  vim.ui_attach(ns, { ext_cmdline = true }, function(e, ...)
    if e == 'cmdline_show' then
      local text, pos, invoker, prompt, indent, level = ...
      state.text = text
    elseif e == 'cmdline_close' then
    elseif e == 'cmdline_pos' then
    end
  end)
end

-- return {
--   setup = setup
-- }
layout:mount()
