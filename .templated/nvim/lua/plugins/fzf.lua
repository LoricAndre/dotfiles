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

return {
  'ibhagwan/fzf-lua',
  opts = {
    'skim',
    -- fzf_bin = '/home/loric/src/skim/target/debug/sk',
    winopts = {
      preview = {
        default = 'bat',
      },
    },
  },
  config = function(_, opts)
    opts.file_ignore_patterns = parse_wildignore()
    require('fzf-lua').setup(opts)
    require('fzf-lua').register_ui_select()
  end,
  command = 'FzfLua',
  keys = {
    {
      '<leader>f',
      function()
        require('fzf-lua').files()
      end,
    },
    {
      '<leader>s',
      function()
        require('fzf-lua').grep_project()
      end,
    },
    {
      '<leader>b',
      function()
        require('fzf-lua').buffers()
      end,
    },
    {
      '<F1>',
      function()
        require('fzf-lua').helptags()
      end,
    },
    {
      '<leader>cr',
      function()
        require('fzf-lua').lsp_references()
      end,
    },
    {
      '<leader>cd',
      function()
        require('fzf-lua').lsp_definitions()
      end,
    },
    {
      '<leader>cD',
      function()
        require('fzf-lua').lsp_declarations()
      end,
    },
    {
      '<leader>ct',
      function()
        require('fzf-lua').lsp_typedefs()
      end,
    },
    {
      '<leader>ci',
      function()
        require('fzf-lua').lsp_implementations()
      end,
    },
    {
      '<leader>cs',
      function()
        require('fzf-lua').lsp_document_symbols()
      end,
    },
    {
      '<leader>cS',
      function()
        require('fzf-lua').lsp_live_workspace_symbols()
      end,
    },
    {
      '<leader>ca',
      function()
        require('fzf-lua').lsp_code_actions()
      end,
    },
    {
      '<leader>ce',
      function()
        require('fzf-lua').diagnostics_document()
      end,
    },
    {
      '<leader>cE',
      function()
        require('fzf-lua').diagnostics_workspace()
      end,
    },
  },
}
