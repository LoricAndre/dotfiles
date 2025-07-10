function _G.mode_icon()
  local mode_map = {
    ['n']     = '󰇀',
    ['no']    = '󰒲',
    ['nov']   = '󰒲',
    ['noV']   = '󰒲',
    ['no\22'] = '󰒲',
    ['niI']   = '󰇀',
    ['niR']   = '󰇀',
    ['niV']   = '󰇀',
    ['nt']    = '󰇀',
    ['ntT']   = '󰇀',
    ['v']     = '',
    ['vs']    = '',
    ['V']     = '',
    ['Vs']    = '',
    ['\22']   = '󰒅',
    ['\22s']  = '󰒅',
    ['s']     = '',
    ['S']     = '',
    ['\19']   = '󰒅',
    ['i']     = '󰗧',
    ['ic']    = '󰗧',
    ['ix']    = '󰗧',
    ['R']     = '',
    ['Rc']    = '',
    ['Rx']    = '',
    ['Rv']    = '',
    ['Rvc']   = '',
    ['Rvx']   = '',
    ['c']     = '󰅴',
    ['cv']    = '󰅴',
    ['ce']    = '󰅴',
    ['r']     = '',
    ['rm']    = '󰁅',
    ['r?']    = '',
    ['!']     = '',
    ['t']     = '',
  }
  local mode_code = vim.api.nvim_get_mode().mode
  if mode_map[mode_code] == nil then
    return mode_code
  end
  return mode_map[mode_code]
end

function _G.lsp_clients_str(bufnr, sep, prefix)
  local clients = vim.lsp.get_clients({ bufnr = bufnr })
  local has_devicons, devicons = pcall(require, 'nvim-web-devicons')
  if not prefix and has_devicons then
    prefix = devicons.get_icon(vim.api.nvim_buf_get_name(bufnr)) .. ' '
  end
  local res
  for _, c in ipairs(clients) do
    if c.name ~= 'GitHub Copilot' then
      if not res then
        res = prefix
      else
        res = res .. sep
      end
      res = res .. c.name
    end
  end
  return res
end

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = '' },
      section_separators = { left = '◤', right = '◢' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = true,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      },
    },
    sections = {
      lualine_a = {
        { '_G.mode_icon()', separator = { left = '' } },
      },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        'filename',
        "_G.lsp_clients_str(0, ' - ', nil)",
      },
      lualine_x = {
        {
          'overseer',
          label = '',     -- Prefix for task counts
          colored = true, -- Color the task icons and counts
          symbols = {
            FAILURE = ' ',
            CANCELED = '󰜺 ',
            SUCCESS = ' ',
            RUNNING = ' ',
          },
          unique = true,      -- Unique-ify non-running task count by name
          name = nil,         -- List of task names to search for
          name_not = false,   -- When true, invert the name search
          status = nil,       -- List of task statuses to display
          status_not = false, -- When true, invert the status search
        },
        'encoding',
        'fileformat',
        'filetype'
      },
      lualine_y = { 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' } },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  },
}
