local overseer = require("overseer")
local subcommands = {
  "up",
  "down"
}

local template = {
  priority = 10,
  params = {
    cmd = { type = "string", optional = false },
    services = { type = "list", delimiter = " ", default = " " },
    wait = { type = "boolean", default = true },
    build = { type = "boolean", default = true },
    remove_orphans = { type = "boolean", default = true },
  },
  builder = function(params)
    local args = { "compose", params.cmd }
    if params.cmd == "up" then
      if params.wait then
        table.insert(args, #args + 1, "--wait")
      else
        table.insert(args, #args + 1, "-d")
      end
      if params.build then
        table.insert(args, #args + 1, "--build")
      end
    end
    if params.wait then
      table.insert(args, #args + 1, "--remove-orphans")
    end
    vim.list_extend(args, params.services)
    return {
      cmd = "docker",
      args = args
    }
  end
}
return {
  condition = {
    callback = function(search)
      return vim.fn.empty(vim.fn.glob(search.dir .. "docker-compose.*")) == 0
    end,
  },
  generator = function(opts, callback)
    local res = {}
    for _, cmd in pairs(subcommands) do
      table.insert(
        res,
        overseer.wrap_template(
          template,
          { name = string.format("docker compose %s", cmd) },
          { cmd = cmd }
        )
      )
    end
    callback(res)
  end
}
