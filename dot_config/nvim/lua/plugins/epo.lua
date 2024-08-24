local kind_icon = {
  snippet = " ",
  lsp = " ",
  ["function"] = "󰅲 ",
  keyword = " ",
  text = " ",
  property = "󰉺 ",
  field = "󰉺 ",
  variable = "󰫧 ",
}


return {
  "nvimdev/epo.nvim",
  cond = require("settings").completion == "epo",
  opts = {
    fuzzy = true,
    debounce = 50,
    signature = true,
    snippet_path = nil,
    kind_format = function(k)
      return kind_icon[k:lower()] or k:upper() --:sub(1, 1)
    end
  },
  keys = {
    {"<Tab>", function()
      if vim.fn.pumvisible() == 1 then
        return '<C-n>'
      elseif vim.snippet.jumpable(1) then
        return '<cmd>lua vim.snippet.jump(1)<CR>'
      else
        return '<Tab>'
      end
    end,
    noremap = false,
    expr = true,
    mode = "i"
    },
    {"<S-Tab>", function()
      if vim.fn.pumvisible() == 1 then
        return '<C-p>'
      elseif vim.snippet.jumpable(-1) then
        return '<cmd>lua vim.snippet.jump(-1)<CR>'
      else
        return '<S-Tab>'
      end
    end,
    },
    noremap = false,
    expr = true,
    mode = "i"
  },
  lazy = false
}
