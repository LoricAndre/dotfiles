return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*",
  opts = {
    custom_key_maps = {
      {
        { "n", "x", "v", "o" },
        "j",
        function(_, count)
          if count == 0 then
            vim.cmd("normal! h")
          else
            vim.cmd("normal! " .. count .. "h")
          end
        end
      },
      {
        { "n", "x", "v", "o" },
        "k",
        function(_, count)
          if count == 0 then
            vim.cmd("normal! j")
          else
            vim.cmd("normal! " .. count .. "j")
          end
        end
      },
      {
        { "n", "x", "v", "o" },
        "l",
        function(_, count)
          if count == 0 then
            vim.cmd("normal! k")
          else
            vim.cmd("normal! " .. count .. "k")
          end
        end
      },
      {
        { "n", "x", "v", "o" },
        "m",
        function(_, count)
          if count == 0 then
            vim.cmd("normal! l")
          else
            vim.cmd("normal! " .. count .. "l")
          end
        end
      },
    },
  },
  keys = {
    { "<C-k>",         "<Cmd>MultipleCursorsAddDown<CR>" },
    { "<C-Down>",      "<Cmd>MultipleCursorsAddDown<CR>",        mode = { "n", "i" } },
    { "<C-l>",         "<Cmd>MultipleCursorsAddUp<CR>" },
    { "<C-Up>",        "<Cmd>MultipleCursorsAddUp<CR>",          mode = { "n", "i" } },
    { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" } },
    { "<leader>m",     "<Cmd>MultipleCursorsAddMatches<CR>",     mode = { "n", "x" }, desc = "[multicursor] add matches" },
  },
}
