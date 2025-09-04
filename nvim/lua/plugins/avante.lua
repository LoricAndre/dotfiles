return {
  'yetone/avante.nvim',
  lazy = true,
  enabled = false,
  dependencies = {
    { 'stevearc/dressing.nvim', lazy = true },
    { 'nvim-lua/plenary.nvim',  lazy = true },
    { 'MunifTanjim/nui.nvim',   lazy = true },
    { 'ibhagwan/fzf-lua',       lazy = true },
    {
      'github/copilot.vim',
      lazy = true,
      event = 'VeryLazy',
      cmd = { 'Copilot' },
    },
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    {
      'saghen/blink.cmp',
      lazy = true,
      opts = {
        sources = {
          per_filetype = {
            avante = {
              'avante_commands',
              'avante_mentions',
              'avante_files',
            },
          },
          providers = {
            avante_commands = {
              name = 'avante_commands',
              module = 'blink.compat.source',
              score_offset = 90, -- show at a higher priority than lsp
              opts = {},
            },
            avante_files = {
              name = 'avante_commands',
              module = 'blink.compat.source',
              score_offset = 100, -- show at a higher priority than lsp
              opts = {},
            },
            avante_mentions = {
              name = 'avante_mentions',
              module = 'blink.compat.source',
              score_offset = 1000, -- show at a higher priority than lsp
              opts = {},
            }
          }
        }
      },
    },
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
  },
  opts = {
    provider = 'copilot',
    selector = {
      provider = 'fzf_lua',
      provider_opts = {},
    },
    providers = {
      mistral = {
        api_key_name = 'cmd:pass show mistral-api-key',
        model = 'codestral-latest',
        endpoint = 'https://codestral.mistral.ai/v1',
        __inherited_from = 'openai',
      },
      claude = {
        api_key_name = 'cmd:pass show anthropic-api-key',
        disable_tools = {
          'git_diff',
          'rag_search',
          'python',
          'git_commit',
          'bash',
          'web_search',
        },
        extra_request_body = {
          max_tokens = 4096,
        },
      },
    },
    hints = {
      enabled = false,
    },
    mappings = {
      diff = {
        ours = 'co',
        theirs = 'ct',
        all_theirs = 'ca',
        both = 'cb',
        cursor = 'cc',
        next = ']x',
        prev = '[x',
      },
      suggestion = {
        accept = '<M-l>',
        next = '<M-]>',
        prev = '<M-[>',
        dismiss = '<C-]>',
      },
      jump = {
        next = ']]',
        prev = '[[',
      },
      submit = {
        normal = '<CR>',
        insert = '<C-s>',
      },
      sidebar = {
        apply_all = 'A',
        apply_cursor = 'a',
        switch_windows = '<Tab>',
        reverse_switch_windows = '<S-Tab>',
      },
    },
  },
  build = 'make',
  keys = {
    { '<leader>aa', '<CMD>AvanteAsk<CR>',         desc = '[llm] ask avante' },
    { '<leader>af', '<CMD>AvanteFocus<CR>',       desc = '[llm] focus avante' },
    { '<leader>ac', '<CMR>AvanteChat<CR>',        desc = '[llm] open avante chat' },
    { '<leader>at', '<CMD>AvanteToggle<CR>',      desc = '[llm] toggle avante' },
    { '<leader>ah', '<CMD>AvanteHistory<CR>',     desc = '[llm] avante history' },
    { '<leader>am', '<CMD>AvanteShowRepoMap<CR>', desc = '[llm] avante repo map' },
  },
  cmd = {
    'AvanteAsk',
    'AvanteBuild',
    'AvanteChatNew',
    'AvanteHistory',
    'AvanteClear',
    'AvanteEdit',
    'AvanteRefresh',
    'AvanteStop',
    'AvanteSwitchProvider',
    'AvanteShowRepoMap',
    'AvanteModels',
    'AvanteSwitchSelectorProvider',
    'AvanteFocus',
    'AvanteChat',
    'AvanteToggle'
  }
}
