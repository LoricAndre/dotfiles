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
    filesystem = {
      components = {
        icon = function(config, node, state)
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
  },
}
