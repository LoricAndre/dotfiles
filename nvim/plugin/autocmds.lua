local chezmoi_dir = vim.fn.expand('~/.local/share/chezmoi')
local dots_dir = vim.fn.expand('~/dots')

local autocmds = {
  -- Sidebar
  -- {
  --   'BufEnter',
  --   'SidebarNvim_*',
  --   function()
  --     vim.keymap.set('n', 'k', '<Down>', { noremap = true, buffer = true })
  --     vim.keymap.set('n', 'l', '<Up>', { noremap = true, buffer = true })
  --     vim.keymap.set('n', 'm', 'e', { noremap = false, buffer = true })
  --     vim.keymap.set('n', 'j', 't', { noremap = false, buffer = true })
  --   end,
  -- },
  { 'BufWinEnter', '?*',       'silent! loadview 1' },
  { 'BufWinLeave', '?*',       'silent! mkview 1' },
  { 'BufEnter',    'term://*', 'startinsert' },
  { 'BufNew',      'term://*', 'startinsert' },
  { 'TermOpen',    '*',        'startinsert' },
  { 'BufWinEnter', 'term://*', 'startinsert' },
  { 'BufLeave',    'term://*', 'stopinsert' },
  {
    'FileType',
    { 'sql', 'mysql', 'psql' },
    function()
      vim.bo.commentstring('-- %s')
    end,
  },
  -- {
  -- 	"BufWritePost",
  -- 	chezmoi_dir .. "/*",
  -- 	function()
  -- 		vim.notify("[chezmoi] Applying dotfiles changes...")
  -- 		local ret = vim.system({
  -- 			"cp",
  -- 			vim.fn.expand("~/.config/nvim/lazy-lock.json"),
  -- 			chezmoi_dir .. "/dot_config/external_nvim",
  -- 		}):wait()
  -- 		if ret.code ~= 0 then
  -- 			vim.notify("[ERR] failed to copy lazy-lock: " .. ret.stderr)
  -- 		end
  -- 		vim.system({ "chezmoi", "apply", "--exclude", "scripts", "--force" }):wait()
  -- 		vim.notify("[chezmoi] Applied dotfiles changes")
  -- 	end,
  -- },
  {
    'BufWritePost',
    dots_dir .. '/*',
    function(ev)
      local module, found =
          string.gsub(ev.match, '^' .. dots_dir .. '/(%w[^/]*)/.*$', '%1')
      if found ~= 1 then
        return
      end
      vim.notify('[dots/' .. module .. '] Applying dotfiles changes...')
      if module == 'nvim' then
        local ret = vim
            .system({
              'cp',
              vim.fn.expand('~/.config/nvim/lazy-lock.json'),
              dots_dir .. '/nvim',
            })
            :wait()
        if ret.code == 0 then
          vim.notify('[dots/' .. module .. '] Copied lazy lock')
        else
          vim.notify('[ERR] failed to copy lazy-lock: ' .. ret.stderr)
        end
      end
      vim.system(
        {
          dots_dir .. '/bin/dots',
          'apply',
          module,
        },
        nil,
        function(out)
          if out.code == 0 then
            vim.schedule(function()
              vim.notify('[dots/' .. module .. '] Applied dotfiles changes')
            end)
          else
            vim.schedule(function()
              vim.notify(
                '[dots/'
                .. module
                .. '] Failed to apply dotfiles changes: '
                .. out.stderr,
                vim.log.levels.WARN
              )
            end)
          end
        end
      )
    end,
  },
  {
    'BufWritePre',
    '*',
    function(e)
      vim.system({ 'mkdir', '-p', vim.fs.dirname(e.match) }):wait()
    end,
  },
}

local group = vim.api.nvim_create_augroup('custom_autocmds', { clear = true })
for _, opts in ipairs(autocmds) do
  if type(opts[3]) == 'string' then
    vim.api.nvim_create_autocmd(opts[1], {
      pattern = opts[2],
      ---@diagnostic disable-next-line: assign-type-mismatch
      command = opts[3],
      group = group,
    })
  else
    vim.api.nvim_create_autocmd(opts[1], {
      pattern = opts[2],
      callback = opts[3],
      group = group,
    })
  end
end
