vim.cmd [[
  augroup neoformat
    au!
    au BufWritePre * undojoin | NeoFormat
  augroup END
]]
