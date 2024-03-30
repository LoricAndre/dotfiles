local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

local dt_pattern = vim.fn.expand("~/dt") .. "/**"


local group = aug("dt", {clear = true})
au({"BufWritePost"}, {
  pattern = {dt_pattern},
  group = "dt",
  command = "!dt-cli"
})
