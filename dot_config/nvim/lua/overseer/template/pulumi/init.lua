local overseer = require("overseer")
local subcommands = {
  "up",
  "destroy"
}

local template = {
  priority = 10,
  params = {
    args = {}
  },
  builder = function(params)
    return {
      cmd = "pulumi",
      args = params.args
    }
  end
}
return {
  condition = {
    callback = function(search)
      return vim.fn.empty(vim.fn.glob(search.dir .. "Pulumi.yaml")) == 0
    end,
  },
  generator = function(opts, callback)
    local res = {}
    for _, cmd in pairs(subcommands) do
      table.insert(
        res,
        overseer.wrap_template(
          template,
          { name = string.format("pulumi %s", cmd) },
          { args = { cmd, "--cwd", opts.dir } }
        )
      )
    end
    callback(res)
  end
}
