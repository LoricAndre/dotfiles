local match = {
  c = "commit",
  p = "push",
  a = "add"
}
return function(...)
  local arg = {...}
  local gitCmd = match[arg[1]] or arg[1]
  if gitCmd == "commit" then
    return require'fzterm'.commit()
  else
    local cmd = "!git " .. gitCmd
    for i,v in pairs(arg) do
      if i ~= 1 then
        cmd = cmd .. " " .. v
      end
    end
    return vim.cmd(cmd)
  end
end
