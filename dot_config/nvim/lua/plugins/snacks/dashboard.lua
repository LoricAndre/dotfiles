local function picker()
  if require('settings').finder == 'fzf' then
    return 'fzf-lua'
  else
    return require('settings').finder
  end
end

return {
  preset = {
    pick = picker(),
  },
  sections = {
    { section = 'header' },
    { section = 'keys', gap = 1, padding = 1 },
    { section = 'startup' },
    {
      section = 'terminal',
      cmd = 'bat --plain --plain --line-range 12: /usr/share/nvim/runtime/doc/news.txt',
      pane = 2,
      height = 30,
      width = 100,
    },
  },
}
