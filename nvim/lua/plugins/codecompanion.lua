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
    return {
      strategies = {
        chat = {
          adapter = 'mistral',
          slash_commands = {
            files = {
              description = 'Add files to context',
              callback = CodeCompanionAddFiles,
            },
          },
        },
        inline = {
          adapter = 'mistral',
        },
      },
      adapters = {
        mistral = function()
          return require('codecompanion.adapters').extend('mistral', {
            schema = {
              model = {
                default = 'codestral-latest',
              },
            },
            env = {
              url = 'https://codestral.mistral.ai',
              api_key = 'cmd:pass show mistral-api-key',
            },
          })
        end,
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
      '<leader>aa',
      '<CMD>CodeCompanion<CR>',
      desc = '[llm] open code companion prompt',
    },
    {
      '<leader>ac',
      '<CMD>CodeCompanionChat<CR>',
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
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
}
