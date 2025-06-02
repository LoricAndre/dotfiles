return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    dependencies = {
      {
        'blink.cmp',
        lazy = true,
        opts = {
          sources = {
            per_filetype = {
              lua = {
                'lazydev',
                inherit_defaults = true,
              },
            },
            providers = {
              lazydev = {
                module = 'lazydev.integrations.blink',
                score_offset = 100,
              },
            },
          },
        },
      },
    },
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        'snacks',
        'lazy.nvim',
      },
    },
  },
}
