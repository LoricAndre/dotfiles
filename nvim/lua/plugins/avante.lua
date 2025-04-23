return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  enabled = false,
  version = '*', -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    provider = 'mistral',
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
      max_tokens = 4096,
    },
    vendors = {
      mistral = {
        api_key_name = 'cmd:pass show mistral-api-key',
        model = 'codestral-latest',
        endpoint = 'https://codestral.mistral.ai/v1',
        __inherited_from = 'openai',
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
  dependencies = {
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'ibhagwan/fzf-lua',
  },
  keys = {
    { '<leader>aa', '<CMD>AvanteFocus<CR>', desc = '[llm] focus avante' },
    { '<leader>ac', '<CMR>AvanteChat<CR>', desc = '[llm] open avante chat' },
    { '<leader>at', '<CMD>AvanteToggle<CR>', desc = '[llm] toggle avante' },
  },
}
