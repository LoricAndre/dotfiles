return {
  'snacks.nvim',
  enabled = true,
  opts = {
    dashboard = {
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
    },
  },
}
