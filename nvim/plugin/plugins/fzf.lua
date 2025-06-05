local function parse_wildignore()
  local ret = {}
  for _, path in ipairs(vim.opt.wildignore:get()) do
    local regex = string.gsub(path, '%*%*', '.thisisastartreplacemelater')
    regex = string.gsub(regex, '%*', '[^/]*')
    regex = string.gsub(regex, 'thisisastartreplacemelater', '*')
    regex = string.gsub(regex, '%?', '[^/]')
    table.insert(ret, regex)
  end
  return ret
end

function FzfLuaSmart(opts)
  local config = require('fzf-lua.config')
  local core = require('fzf-lua.core')
  local path = require('fzf-lua.path')
  local libuv = require('fzf-lua.libuv')
  local make_entry = require('fzf-lua.make_entry')
  opts = config.normalize_opts(opts, 'git.files')
  if not opts then
    return
  end
  opts.cwd = path.git_root(opts)
  opts.git_icons = true
  opts.file_icons = true
  local git_fn
  if opts.cwd then
    local git_cmd = core.mt_cmd_wrapper(opts)
    git_fn = libuv.spawn_nvim_fzf_cmd({
      ---@diagnostic disable-next-line
      cmd = git_cmd,
      cwd = opts.cwd,
      cb_pid = function(pid)
        opts.__pid = pid
      end,
    })
  else
    git_fn = function(_, _, _) end
  end
  local contents = function(x, cb, y)
    make_entry.preprocess(opts)
    for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
      if
          vim.api.nvim_buf_is_loaded(buf_id) and vim.fn.buflisted(buf_id) == 1
      then
        local p = vim.api.nvim_buf_get_name(buf_id)
        local exists, stats = pcall(vim.uv.fs_stat, p)
        if exists and stats and stats.type == 'file' then
          x(make_entry.file(p, opts))
        end
      end
    end

    git_fn(x, cb, y)
  end
  opts = core.set_header(opts, opts.headers or { 'cwd' })
  return core.fzf_exec(contents, opts)
end

require('fzf-lua').setup({
    'skim',
    -- fzf_bin = '/home/loric/src/skim/target/debug/sk',
    winopts = {
      preview = {
        default = 'bat',
      },
    },
    file_ignore_patterns = parse_wildignore()
})
require('fzf-lua').register_ui_select()

vim.keymap.set('n', '<leader>f', function() require('fzf-lua').files() end, { desc = '[fzf] find files' })
vim.keymap.set('n', '<leader>s', function() require('fzf-lua').grep_project() end, { desc = '[fzf] grep project' })
vim.keymap.set('n', '<leader>b', function() require('fzf-lua').buffers() end, { desc = '[fzf] find buffers' })
vim.keymap.set('n', '<F1>', function() require('fzf-lua').helptags() end, { desc = '[fzf] help tags' })
vim.keymap.set('n', '<leader>cr', function() require('fzf-lua').lsp_references() end, { desc = '[lsp] references' })
-- vim.keymap.set('n', '<leader>cd', function() require('fzf-lua').lsp_definitions() end, { desc = '[lsp] definitions' })
-- vim.keymap.set('n', '<leader>cD', function() require('fzf-lua').lsp_declarations() end, { desc = '[lsp] declarations' })
-- vim.keymap.set('n', '<leader>ct', function() require('fzf-lua').lsp_typedefs() end, { desc = '[lsp] type definition' })
-- vim.keymap.set('n', '<leader>ci', function() require('fzf-lua').lsp_implementations() end, { desc = '[lsp] implementations' })
vim.keymap.set('n', '<leader>cs', function() require('fzf-lua').lsp_document_symbols() end, { desc = '[lsp] document symbols' })
vim.keymap.set('n', '<leader>cS', function() require('fzf-lua').lsp_live_workspace_symbols() end, { desc = '[lsp] workspace symbols' })
vim.keymap.set('n', '<leader>ca', function() require('fzf-lua').lsp_code_actions() end, { desc = '[lsp] code actions' })
-- vim.keymap.set('n', '<leader>ce', function() require('fzf-lua').diagnostics_document() end, { desc = '[lsp] file diagnostics' })
-- vim.keymap.set('n', '<leader>cE', function() require('fzf-lua').diagnostics_workspace() end, { desc = '[lsp] workspace diagnostics' })
