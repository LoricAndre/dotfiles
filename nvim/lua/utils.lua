vim = vim -- Just so LSP will shut up

map = vim.api.nvim_set_keymap
au = function(event, group, cmd)
  return vim.cmd("au " .. event .. " " .. group .. " " .. cmd)
end
