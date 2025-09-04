return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim',                    lazy = true },
    { 'nvim-tree/nvim-web-devicons',              lazy = true },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', lazy = true },
    { 'nvim-telescope/telescope-ui-select.nvim',  lazy = true },
  },
  cmd = 'Telescope',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>f',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = '[telescope] find files',
    },
    {
      '<leader>s',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = '[telescope] live grep',
    },
    {
      '<leader>b',
      function()
        require('telescope.builtin').buffers()
      end,
      desc = '[telescope] find buffers',
    },
    {
      '<F1>',
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = '[telescope] help tags',
    },
    {
      '<leader>cr',
      function()
        require('telescope.builtin').lsp_references()
      end,
      desc = '[lsp] references',
    },
    {
      '<leader>cd',
      function()
        require('telescope.builtin').lsp_definitions()
      end,
      desc = '[lsp] definitions',
    },
    {
      '<leader>cD',
      function()
        require('telescope.builtin').lsp_declarations()
      end,
      desc = '[lsp] declarations',
    },
    {
      '<leader>ct',
      function()
        require('telescope.builtin').lsp_typedefs()
      end,
      desc = '[lsp] type definition',
    },
    {
      '<leader>ci',
      function()
        require('telescope.builtin').lsp_implementations()
      end,
      desc = '[lsp] implementations',
    },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<esc>'] = actions.close,
          },
        },
        prompt_prefix = '❯ ',
        selection_caret = '❯ ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
            results_width = 0.8,
          }
        }
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = 'smart_case',       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({
            -- even more opts
          }),
        },
      },
    })
    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
  end,
}
