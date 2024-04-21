local colorscheme = "catppuccin-mocha"


local repos = {
  nordfox = "EdenEast/nightfox.nvim",
  dracula = "Mofiqul/dracula.nvim",
  catpuccin = "catppuccin/nvim"
}


local specs = {}
local is_first = true

for _, value in pairs(repos) do
  local spec
  if is_first then
    spec = {
      value,
      config = function ()
        vim.cmd("colorscheme " .. colorscheme)
      end
    }
    is_first = false
  else
    spec = { value }
  end
  table.insert(specs, spec)
end

return specs
