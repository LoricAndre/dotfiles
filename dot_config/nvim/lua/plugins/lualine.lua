local function lsp_servers()
  local servers = vim.lsp.get_clients()
  local server_names = vim.tbl_map(function(x) return x.name end, servers)
  local prefix = ""
  if #server_names > 0 then
    return prefix .. vim.fn.join(server_names)
  end
  return ""
end

return {
  "nvim-lualine/lualine.nvim",
  requires = {
    {
      "kyazdani42/nvim-web-devicons",
      opt = true
    },
    "arkav/lualine-lsp-progress"
  },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        -- theme = "dracula-nvim",
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = { "filename", lsp_servers, "lsp_progress" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = {
          { "diagnostics", sources = { "nvim_workspace_diagnostic" } }
        },
        lualine_z = { "searchcount", "location" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        lualine_a = { "buffers" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "branch" }
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    })
  end
}
