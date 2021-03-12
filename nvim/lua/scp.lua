local vim = vim


return {
  scp = function(user, ip, path)
    local i = 0
    while (true) do
      if (vim.fn.isdirectory('/tmp/scp' .. i) == 1) then
        i = i + 1
      else
        break
      end
    end
    local dest_dir = '/tmp/scp' .. i .. '/'
    vim.cmd('silent !mkdir ' .. dest_dir)
    local ignore = vim.g.scp_ignore or 'node_modules'
    local cmd = string.format('silent !rsync -av -e ssh %s@%s:%s %s --exclude="%s"',
      user,
      ip,
      path,
      dest_dir,
      ignore)
    vim.cmd(cmd)
    local tail
    for s in string.gmatch(path, "[^/]+") do
      tail = s
    end
    vim.cmd('silent edit ' .. dest_dir .. tail .. ' | cd %:p:h')
    local send_cmd = string.format("nohup scp %s %s@%s:%s >/dev/null &", "%:s?"..dest_dir.."??", user, ip, path)
    local autocommand = "au BufWrite " .. dest_dir .."* silent !" .. send_cmd
    vim.cmd(autocommand)
  end
}
