return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = not vim.g.started_by_firenvim,
    opts = {
      {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,

            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true,        -- add a border to hover docs and signature help

        },

      }
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    }
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    event = "VeryLazy",
    keys = {
      { "<leader>gs", function() return require("gitsigns").stage_hunk() end,                                            desc = "[GIT] Stage Hunk" },
      { "<leader>gs", function() return require("gitsigns").stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,      desc = "[GIT] Stage Selected",      mode = "v" },
      { "<leader>gu", function() return require("gitsigns").undo_stage_hunk() end,                                       desc = "[GIT] Unstage Hunk" },
      { "<leader>gu", function() return require("gitsigns").undo_stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, desc = "[GIT] Unstage Selected",    mode = "v" },
      { "<leader>gr", function() return require("gitsigns").reset_hunk() end,                                            desc = "[GIT] Reset Hunk" },
      { "<leader>gr", function() return require("gitsigns").reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,      desc = "[GIT] Reset Selected",      mode = "v" },
      { "<leader>gp", function() return require("gitsigns").preview_hunk() end,                                          desc = "[GIT] Preview Hunk" },
      { "<leader>gp", function() return require("gitsigns").preview_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,    desc = "[GIT] Preview Selected",    mode = "v" },
      { "<leader>gS", function() return require("gitsigns").stage_buffer() end,                                          desc = "[GIT] Stage Buffer" },
      { "<leader>gR", function() return require("gitsigns").reset_buffer() end,                                          desc = "[GIT] Reset Buffer" },
      { "<leader>gb", function() return require("gitsigns").blame_line() end,                                            desc = "[GIT] Blame Line" },
      { "<leader>gB", function() return require("gitsigns").toggle_current_line_blame() end,                             desc = "[GIT] Blame Line" },
      { "<leader>gd", function() return require("gitsigns").diffthis() end,                                              desc = "[GIT] Diff Hunk" },
      { "<leader>gt", function() return require("gitsigns").toggle_deleted() end,                                        desc = "[GIT] Toggle Deleted Lines" },
    }
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    "folke/twilight.nvim",
    opts = {}
  },
}
