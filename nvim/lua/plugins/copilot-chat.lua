return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = false,
    dependencies = {
      {
        'github/copilot.vim',
        cmd = { 'Copilot' },
      }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master', lazy = true }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      window = {
        layout = 'float',
        width = 0.8,
        height = 0.75,
      },
    },
    cmd = {
      'CopilotChat',
      'CopilotChatOpen',
      'CopilotChatClose',
      'CopilotChatToggle',
      'CopilotChatStop',
      'CopilotChatReset',
      'CopilotChatSave',
      'CopilotChatLoad',
      'CopilotChatPrompts',
      'CopilotChatModels',
      'CopilotChatAgents',
    },
    keys = {
      {
        '<leader>aa',
        '<CMD>CopilotChat<CR>',
        desc = '[llm] open copilot chat input',
      },
      {
        '<leader>ac',
        '<CMD>CopilotChatToggle<CR>',
        desc = '[llm] toggle copilot chat window',
      },
      {
        '<leader>ap',
        '<CMD>CopilotChatPrompts<CR>',
        desc = '[llm] select copilot chat prompt',
      },
    },
  },
}
