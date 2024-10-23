return {
  {
    'mfussenegger/nvim-dap',
    cmd = {
      'DapContinue',
      'DapDisconnect',
      'DapEval',
      'DapLoadLaunchJSON',
      'DapNew',
      'DapRestartFrame',
      'DapSetLogLevel',
      'DapShowLog',
      'DapStepInto',
      'DapStepOut',
      'DapStepOver',
      'DapTerminate',
      'DapToggleBreakpoint',
      'DapToggleRepl',
    },
    keys = {
      {
        '<F2>',
        function() require('dap').toggle_breakpoint() end,
        desc = '[DBG] Toggle Breakpoint',
      },
      {
        '<F4>',
        function() require('dap').terminate() end,
        { 'n', 'v' },
        desc = '[DBG] Quit',
      },
      {
        '<F5>',
        function() require('dap').continue() end,
        desc = '[DBG] Continue',
      },
    },
    opts = {},
    config = function(_, opts)
      local has_overseer, overseer = pcall(require, 'overseer')
      if has_overseer then overseer.enable_dap() end
      require('mason').setup(opts)
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'nvim-neotest/nvim-nio', lazy = true },
    after = { 'nvim-dap' },
    keys = {
      {
        '<F17>',
        function() require('dapui').toggle() end,
        desc = '[DBG] Toggle UI',
      },
      {
        '<F3>',
        function() require('dapui').eval() end,
        { 'n', 'v' },
        desc = '[DBG] Eval Code',
      },
    },
    config = function(_, opts)
      local dap = require('dap')
      local dapui = require('dapui')

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      dapui.setup(opts)
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    after = {
      'mason.nvim',
    },
    cmd = {
      'DapInstall',
      'DapUninstall',
    },
    event = 'LspAttach',
    opts = {
      ensure_installed = {
        'coreclr',
        'cppdbg',
        'python',
        'codelldb',
        'node2',
        'js',
        'bash',
      },
      handlers = {}
    },
  },
}
