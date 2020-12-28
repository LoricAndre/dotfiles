local vim = vim

local popup = function()
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'win',
    row = 0,
    col = 0,
    width = vim.api.nvim_win_get_width(0),
    height = 1,
    style= "minimal"
  })
  vim.api.nvim_buf_set_keymap(buf, "i", "\", "<Esc>:lua require'move'.on_close()<CR>", {})
  vim.cmd("start")
end

popup()



return {
  on_close = function()
    print(vim.api.nvim_get_current_line())
    vim.cmd("bd")
  end
}
