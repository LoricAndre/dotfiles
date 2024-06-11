local overseer = require("overseer")
return {
  -- Required fields
  name = "Docker build",
  builder = function(params)
    -- This must return an overseer.TaskDefinition
    return {
      -- cmd is the only required field
      cmd = { 'docker' },
      -- additional arguments for the cmd
      args = { "build", ".", "-t", params.tag },
      -- the name of the task (defaults to the cmd of the task)
      name = "Docker build",
      -- set the working directory for the task
    }
  end,
  -- Optional fields
  desc = "Build docker image",
  -- Tags can be used in overseer.run_template()
  tags = { overseer.TAG.BUILD },
  params = {
    tag = { optional = false, type = "string", default = "test" }
  },
  -- Determines sort order when choosing tasks. Lower comes first.
  priority = 0,
  -- Add requirements for this template. If they are not met, the template will not be visible.
  -- All fields are optional.
  condition = {
    -- A string or list of strings
    -- Only matches when current buffer is one of the listed filetypes
    -- filetype = { "c", "cpp" },
    -- A string or list of strings
    -- Only matches when cwd is inside one of the listed dirs
    -- dir = "/home/user/my_project",
    -- Arbitrary logic for determining if task is available
    callback = function(search)
      return vim.fn.empty(vim.fn.glob(search.dir .. "Dockerfile*")) == 0
    end,
  }
}
