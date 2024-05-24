local extensions = {
  fzf = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  ["ui-select"] = "nvim-telescope/telescope-ui-select.nvim",
  ghq = "nvim-telescope/telescope-ghq.nvim",
  diff = "jemag/telescope-diff.nvim",
  undo = "debugloop/telescope-undo.nvim",
}

local dependencies = { "nvim-lua/plenary.nvim" }

for _, v in pairs(extensions) do
  ---@diagnostic disable-next-line: assign-type-mismatch
  table.insert(dependencies, #dependencies + 1, v)
end

return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  dependencies = dependencies,
  config = function()
    local ts = require("telescope")
    -- local themes = require("telescope.themes")
    local has_trouble, trouble = pcall(require, "trouble.providers.telescope")
    local theme_opts = {} -- themes.get_dropdown()
    local opts = {
      defaults = {
        mappings = {},
        layout_config = {
          center = {
            width = 0.75,
            height = 0.6
          }
        }
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

    local tb = require("telescope.builtin")
    local lsp_handlers = {
      ["textDocument/references"] = tb.lsp_references,
      ["textDocument/definition"] = tb.lsp_definition,
      ["textDocument/documentSymbol"] = tb.lsp_document_symbols,
      ["workspace/symbol"] = tb.lsp_dynamic_workspace_symbols,
    }
    for k, v in pairs(lsp_handlers) do
      vim.lsp.handlers[k] = v
    end
  end,
  keys = {
    { "<leader>a",  function() require('telescope.builtin').grep_string({ search = "" }) end,            noremap = true, desc = "[TSP] Search" },
    { "<leader>f",  function() require('telescope.builtin').find_files() end,                            noremap = true, desc = "[TSP] Files" },
    { "<leader>b",  function() require('telescope.builtin').buffers() end,                               noremap = true, desc = "[TSP] Buffers" },
    { "ge",         function() require('telescope.builtin').diagnostics() end,                           noremap = true, desc = "[LSP] Diagnostic" },
    { "<leader>sd", function() require('telescope').extensions.diff.diff_current({ hidden = true }) end, noremap = true, desc = "[DIF] Diff curent" },
    { "<leader>sD", function() require('telescope').extensions.diff.diff_files({ hidden = true }) end,   noremap = true, desc = "[DIF] Diff files" },
    { "<leader>su", function() require('telescope').extensions.undo.undo() end,                          noremap = true, desc = "[UDO] Undo" },
  },
  cmd = {
    'Telescope'
  }
}
