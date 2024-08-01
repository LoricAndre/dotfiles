return {
  "nvim-neo-tree/neo-tree.nvim",
  module = "neo-tree",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  cmd = {"Neotree"},
  keys = {
    {"<leader>tt", "<CMD>Neotree toggle reveal<CR>"},
  },
  opts = {
    close_if_last_window = true,
    hijack_netrw_behavior = 'disabled',
    window = {
      mappings = {
        j = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        k = { "move_cursor_down" },
        l = { "move_cursor_up"},
        m = { "focus_preview" }
      }
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false
      },
      group_empty_dirs = true
    },
    sources = {
      "document_symbols",
      "git_status",
      "filesystem",
      "buffers"
    }
  }
}
