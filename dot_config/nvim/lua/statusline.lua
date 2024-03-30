return {
  build = function()
    local blocks = {
      "file",
      "spacer",
      "mode",
      "spacer",
      "codeium",
      "spacer",
      "lsp"
    }
    local statusline_string = ""
    for _, block in ipairs(blocks) do
      statusline_string = statusline_string .. [[%{luaeval('pcall(require("statusline").blocks["]] .. block .. [["]) and require("statusline").blocks["]] .. block .. [["]() or ""')}]]
    end
    return statusline_string
  end,
  blocks = {
    mode = function()
      local match = {
        i = " ",
        v = "󰩬 ",
        s = "󰩬 ",
      }
      return match[vim.fn.mode():lower():sub(1, 1)] or ""
    end,
    file = function()
      -- shows only one letter for the directories
      local head = vim.fn.expand("%:h")
      local res = ""
      for _, dir in ipairs(vim.fn.split(head, "/")) do
        res = res .. dir:sub(1, 1) .. "/"
      end
      res = res .. vim.fn.expand("%:t")
      return res
    end,
    spacer = function()
      return " "
    end,
    codeium = function()
      return "󰧑" .. vim.fn['codeium#GetStatusString']()
    end,
    lsp = function()
      local msg = "No Active Lsp"
      local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return " " .. msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return " " ..  client.name
        end
      end
      return " " .. msg
    end
  }
}
