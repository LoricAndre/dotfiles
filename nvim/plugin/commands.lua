vim.api.nvim_create_user_command('Rm', function(args)
  local rmopts = {}
  if args.bang then
    rmopts.force = true
    rmopts.recurse = true
  end
  for _, p in ipairs(args.fargs) do
    vim.fs.rm(p, rmopts)
    for _, id in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_win_get_buf(0) == id then
        require('util').bdel()
      else
        vim.api.nvim_buf_delete(id, {})
      end
    end
  end
end, {
  nargs = '*',
  complete = 'file',
  bang = true
})

vim.api.nvim_create_user_command('Bd', function() require('util').bdel() end, { nargs = 0 })
