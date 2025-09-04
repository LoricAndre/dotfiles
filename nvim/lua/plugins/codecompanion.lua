---Add files to CC context
---@param paths string[]
local function ctx_add_files(paths)
  for _, p in ipairs(paths) do
    local stats = vim.uv.fs_stat(p)
    if stats then
      if stats.type == 'file' then
        -- vim.notify('Add ' .. p .. 'to chat')
        require('codecompanion').last_chat().references:add({
          id = p,
          path = p,
          source = 'codecompanion.strategies.chat.slash_commands.file',
          opts = {
            pinned = true,
          },
        })
      else
        for subp in vim.fs.dir(p) do
          ctx_add_files({ vim.fs.joinpath(p, subp) })
        end
      end
    else
      vim.notify('Could not find file or dir ' .. p, vim.log.levels.WARN)
    end
  end
end

function CodeCompanionAddFiles()
  local has_fzf_lua, fzf = pcall(require, 'fzf-lua')
  if has_fzf_lua then
    fzf.fzf_exec('fd', {
      opts = {
        ['--multi'] = true,
      },
      -- fn_transform = function(x)
      --   return fzf.make_entry.file(x, { file_icons = true, color_icons = true })
      -- end,
      actions = vim.tbl_deep_extend('force', fzf.defaults.actions.files, {
        default = function(selected, _)
          ctx_add_files(selected)
        end,
      }),
    })
  end
end

return {
  'olimorris/codecompanion.nvim',
  opts = function()
    require('util').sidebar.register_ft('codecompanion')
    return {
      strategies = {
        chat = {
          adapter = 'copilot',
          model = 'claude-sonnet-4-20250514',
          tools = {
            editor = {
              opts = {
                require_approval = false,
              },
            },
            files = {
              opts = {
                require_approval = false,
              },
            },
          },
        },
        inline = {
          adapter = 'copilot',
          model = 'claude-sonnet-4-20250514',
        },
        cmd = {
          adapter = 'copilot',
          model = 'claude-sonnet-4-20250514',
        },
      },
      opts = {
        log_level = 'DEBUG',
      },
      display = {
        chat = {
          window = {
            width = 0.3,
          },
        },
      },
    }
  end,
  keys = {
    {
      '<leader>a',
      function() require('util').sidebar.open('CodeCompanionChat') end,
      desc = '[llm] open code companion chat',
    },
  },
  cmd = {
    'CodeCompanion',
    'CodeCompanionChat',
    'CodeCompanionActions',
    'CodeCompanionCmd',
  },
  dependencies = {
    { 'nvim-lua/plenary.nvim',           lazy = true },
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
    {
      'blink.cmp',
      lazy = true,
      opts = {
        sources = {
          per_filetype = {
            codecompanion = {
              'codecompanion',
            },
          },
        },
      },
    },
  },
}
