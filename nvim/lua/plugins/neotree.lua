return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
    { 'nvim-tree/nvim-web-devicons', lazy = true }, -- not strictly required, but recommended
    { 'MunifTanjim/nui.nvim', lazy = true },
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    close_if_last_window = true,
    default_component_configs = {
      indent = {
        indent_size = 1,
        with_markers = false,
      },
      name = {
        use_git_status_colors = false,
      },
      git_status = {
        symbols = {
          -- Change type
          added = '+', -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = '✖', -- this can only be used in the git_status source
          renamed = '󰁕', -- this can only be used in the git_status source
          -- Status type
          untracked = '',
          ignored = '',
          unstaged = '',
          staged = '',
          conflict = '',
        },
      },
    },
    git_status = {
      window = {
        mappings = {
          ['A'] = 'git_add_all',
          ['u'] = 'git_unstage_file',
          ['a'] = 'git_add_file',
          ['r'] = 'git_revert_file',
          ['c'] = 'git_commit',
          ['P'] = 'git_push',
          ['p'] = function(state)
            vim.system(
              { 'git', 'pull', '--autostash' },
              { text = true },
              function(o)
                vim.schedule(function()
                  if o.code == 0 then
                    vim.notify('Git: pulled ')
                  else
                    vim.notify('Git: failed to pull: ' .. o.stderr)
                  end
                end)
              end
            )
          end,
          ['d'] = function()
            vim.cmd('DiffviewOpen')
          end,
          ['gg'] = 'git_commit_and_push',
          ['i'] = 'show_file_details', -- see `:h neo-tree-file-actions` for options to customize the window.
          ['b'] = 'rename_basename',
        },
      },
    },
    filesystem = {
      components = {
        icon = function(config, node)
          local icon = config.default or ' '
          local padding = config.padding or ' '
          local highlights = require('neo-tree.ui.highlights')
          local highlight = config.highlight or highlights.FILE_ICON
          local has_devicons, web_devicons = pcall(require, 'nvim-web-devicons')

          if node.type == 'directory' then
            highlight = highlights.DIRECTORY_ICON
            if has_devicons and node.name:sub(1, #'dots.') == 'dots.' then
              icon = web_devicons.get_icon_by_filetype('conf')
            elseif node:is_expanded() then
              icon = config.folder_open or '-'
            else
              icon = config.folder_closed or '+'
            end
          elseif node.type == 'file' then
            if has_devicons then
              if node.name:sub(1, #'dots.') == 'dots.' then
                icon = web_devicons.get_icon_by_filetype('conf')
                _, highlight = web_devicons.get_icon(node.name, node.ext)
              else
                local devicon, hl = web_devicons.get_icon(node.name, node.ext)
                icon = devicon or icon
                highlight = hl or highlight
              end
            end
          end

          return {
            text = icon .. padding,
            highlight = highlight,
          }
        end,
      },
    },
  },
  keys = {
    {
      '<leader>e',
      '<CMD>Neotree reveal toggle<CR>',
      desc = '[ntr] toggle neotree',
    },
    {
      '<leader>gt',
      '<CMD>Neotree git_status right toggle<CR>',
      desc = '[ntr] toggle git panel',
    },
  },
}
