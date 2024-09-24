local settings = require('settings')
local actions = function()
  local find_a = ''
  local old_a = ''
  local grep_a = ''
  if settings.finder == 'telescope' then
    find_a = 'Telescope find_files'
    old_a = 'Telescope oldfiles'
    grep_a = 'Telescope live_grep'
  elseif settings.finder == 'fzf' then
    find_a = 'FzfLua files'
    old_a = 'FzfLua oldfiles'
    grep_a = 'FzfLua live_grep'
  end
  return {
    { action = find_a, desc = ' Find File', icon = ' ', key = 'f' },
    {
      action = 'ene | startinsert',
      desc = ' New File',
      icon = ' ',
      key = 'n',
    },
    { action = old_a, desc = ' Recent Files', icon = ' ', key = 'r' },
    { action = grep_a, desc = ' Find Text', icon = ' ', key = 'g' },
    { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'z' },
    {
      action = function() vim.api.nvim_input('<cmd>qa<cr>') end,
      desc = ' Quit',
      icon = ' ',
      key = 'q',
    },
  }
end
return {
  'nvimdev/dashboard-nvim',
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
        %##*++++++++++*******++++***#=
        ########%%%%%%%%%%%%%%%%%%#%##
        %%%*==+#%%%%%%%%%%%%%+=--+%%%%
        @@#===--=#%%%%%%%%%*--==--%%%%
        @@@#*++=--*%%%%%%%*---==+*@%%%
        @@@@%#*+=--+%%%%%#-====*#%@@%%
        @@@@@@%#*+=-=+++=--==*%@@%@@%%
        @@@@@@@@#-::::---:::-+%@@%@@%%
        @@@@@@@*------------::-#@%@@@%
        @@@@@@#=-----======----=+*@@@@
        @@@@@@+++==========--+***+*@@@
        @@@@@%*##*++++++=+==-##%%#%@@@
        @@@@@@%###*+++++++===+###@@@@@
        @@@@@@@**+++++****++==++#@@@@@
        @@@@@@@#+***********+++*@@@@@@
        @@@@@@@@****#######****@@@@@@@
        @@@@@@%%%***#######***%@@@@@@@
        @@@@@#*%%#***####****==#%@@@@@
        @@@@#++%%*********++===-==+*#%
    ]]

    logo = string.rep('\n', 8) .. logo .. '\n\n'

    local opts = {
      theme = 'doom',
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, '\n'),
        center = {
          {
            action = 'Telescope smart_open',
            desc = ' Find File',
            icon = ' ',
            key = 'f',
          },
          {
            action = 'ene | startinsert',
            desc = ' New File',
            icon = ' ',
            key = 'n',
          },
          {
            action = 'Telescope live_grep',
            desc = ' Find Text',
            icon = ' ',
            key = 'g',
          },
          { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'z' },
          {
            action = function() vim.api.nvim_input('<cmd>qa<cr>') end,
            desc = ' Quit',
            icon = ' ',
            key = 'q',
          },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            '⚡ Neovim loaded '
              .. stats.loaded
              .. '/'
              .. stats.count
              .. ' plugins in '
              .. ms
              .. 'ms',
          }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == 'lazy' then
      vim.api.nvim_create_autocmd('WinClosed', {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(
            function()
              vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
            end
          )
        end,
      })
    end

    return opts
  end,
}
