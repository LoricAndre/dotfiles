local vim = vim -- Just so LSP will shut up
require'utils'

vim.o.inccommand = "split"
vim.o.autoindent = true
vim.o.path = vim.o.path .. "**"
vim.o.swapfile = false
vim.o.scrolloff = 3
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.t_Co = "256"
-- vim.o.termguicolors = true
vim.o.smartindent = true
vim.o.clipboard = "unnamedplus"
vim.o.hidden = true
vim.o.wildignore = vim.o.wildignore .. "*/node_modules,Session.vim,tags,.git"
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.wrap = true
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 300
vim.o.autowrite = true
vim.o.mouse = "a"
vim.o.wildoptions = ""
vim.g.loaded_netrw = 1
-- Colorscheme
vim.g.nvcode_termcolor = 256
vim.cmd('colorscheme lule')
vim.cmd('hi LineNr ctermbg=NONE ctermfg=NONE')
-- Statusline
local statusline = [[
%#DiffAdd#%{(mode()=~?'n.*')?'N':''}
%#DiffChange#%{(mode()=~?'i.*')?'I':''}
%#DiffDelete#%{(mode()=~?'r.*')?'R':''}
%#Cursor#%{(mode()=~?'v.*')?'V':''}
%#CursorIM#
 %R
%#Cursor#
%m
%#CursorLine# 
%{luaeval('require"options"()')}
 %=
%#CursorLine#
 %{WebDevIconsGetFileTypeSymbol()}
%#CursorIM#
 %3l:%-2c
%#Cursor#
 %3p%%
]]

vim.o.statusline = statusline:gsub('\n', '')
return function()
  local res = ""
  local raw_buffers = vim.api.nvim_exec("ls", true)
  local buffers = {}
  for line in string.gmatch(raw_buffers,'[^\r\n]+') do
    local attrs = {}
    for token in string.gmatch(line, "[^%s]+") do
      table.insert(attrs, token)
    end
    
    local n = attrs[1]
    local name = attrs[2]
    local current = false
    if attrs[2]:sub(1, 1) == "%" then
      name = attrs[3]
      current = true
    elseif attrs[2]:len() <= 2 then
      name = attrs[3]
    end
    name = name:gsub('"', '')
    table.insert(buffers, {name = name, number = n, current = current})
  end

  local buf_len = vim.api.nvim_win_get_width(0) - 50
  buf_len = buf_len / #buffers
  for _,buf in pairs(buffers) do
    local name = buf.name:match("([^/%.]+)%..+$") or buf.name:match("([^/]+)$") or buf.name
    if name:len() == 0 then
      name = buf.name
    end
    if buf.current then
      buf.number = "["..buf.number
      name = name .. "]"
    end
    res = res .. ' | ' .. buf.number .. ': ' .. name:sub(-(buf_len-5))
  end
  return res
end
