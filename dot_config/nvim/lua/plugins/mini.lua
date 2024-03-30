return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    local plugins = {
      "mini.ai",
      "mini.pairs",
    }
    for k, v in pairs(plugins) do
      if type(k) == "string" then
        require(k).setup(v)
      else
        require(v).setup()
      end
    end
  end
}
