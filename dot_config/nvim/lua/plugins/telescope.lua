local extensions = {
  fzf = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  ["ui-select"] = "nvim-telescope/telescope-ui-select.nvim",
  ghq = "nvim-telescope/telescope-ghq.nvim",
}

local dependencies = { "nvim-lua/plenary.nvim" }

for _, v in pairs(extensions) do
---@diagnostic disable-next-line: assign-type-mismatch
  table.insert(dependencies, #dependencies+1, v)
end

return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  dependencies = dependencies,
  config = function()
    local ts = require("telescope")
    local themes = require("telescope.themes")
    local has_trouble, trouble = pcall(require, "trouble.providers.telescope")
    local theme_opts = themes.get_dropdown()
    local opts = {
      defaults = {
        mappings = {},
      }
    }
    opts["defaults"] = vim.tbl_extend("force", theme_opts, opts["defaults"])
    if has_trouble then
      opts["defaults"]["mappings"] = vim.tbl_extend("force", opts["defaults"]["mappings"], {
        i = { ["<C-t>"] = trouble.open_with_trouble },
        n = { ["<C-t>"] = trouble.open_with_trouble },
      })
    end
    ts.setup(opts)
    for k, _ in pairs(extensions) do
      pcall(ts.load_extension, k)
    end
  end,
  keys = {
    {
      "<leader>a",
      function()
        require('telescope.builtin').live_grep()
      end,
      noremap = true,
      desc = "Telescope live grep"
    },
    { "<leader>f",  function() require('telescope.builtin').find_files() end,             noremap = true, desc = "[TSP] Files" },
    { "<leader>b",  function() require('telescope.builtin').buffers() end,                noremap = true, desc = "[TSP] buffers" },
    { "<leader>cr", function() require('telescope.builtin').lsp_references() end,         noremap = true, desc = "[LSP] References" },
    { "<leader>cd", function() require('telescope.builtin').lsp_definitions() end,        noremap = true, desc = "[LSP] Definitions" },
    { "<leader>ci", function() require('telescope.builtin').lsp_implementations() end,    noremap = true, desc = "[LSP] Implementations" },
    { "<leader>cs", function() require('telescope.builtin').lsp_workspace_symbols() end,  noremap = true, desc = "[LSP] workspace symbols" },
    { "<leader>cS", function() require('telescope.builtin').lsp_document_symbols() end,   noremap = true, desc = "[LSP] document symbols" },
    -- { "<leader>w",  function() require('telescope').extensions.persisted.persisted() end, noremap = true, desc = "[WS] switch session" }
  },
  cmd = {
    'Telescope'
  }
}
