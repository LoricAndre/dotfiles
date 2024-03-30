local sections = {
  mason = {
    icon = " ",
    desc = "Mason",
    key = "a",
    action = "Mason"
  },
  files = {
    icon = " ",
    desc = "Files",
    key = "f",
    action = "Telescope find_files"
  },
  projects = {
    icon = "󰊢 ",
    desc = "List projects",
    key = "p",
    action = "Telescope neovim-project"
  },
  sessions = {
    icon = " ",
    desc = "List sessions",
    key = "w",
    action = "SessionManager load_session"
  },
  dir_session = {
    icon = " ",
    desc = "Load current dir session",
    key = "s",
    action = "SessionManager load_current_dir_session"
  },
  last_session = {
    icon = " ",
    desc = "Load last session",
    key = "S",
    action = "SessionManager load_last_session"
  },
  repos = {
    icon = "󰊢 ",
    desc = "List repos",
    key = "r",
    action = "Telescope repo"
  }
}

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = "hyper",
      change_to_vcs_root = true,
      config = {
        week_header = {
          enable = true
        },
        shortcut = {
          sections.files,
          sections.sessions,
          sections.dir_session,
          sections.last_session,
          sections.config,
          sections.mason,
        }
      }
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
