return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "rcarriga/nvim-dap-ui",         lazy = true },
    { "jay-babu/mason-nvim-dap.nvim", lazy = true },
    { "nvim-neotest/nvim-nio",        lazy = true },
    { "williamboman/mason.nvim",      lazy = true },
  },
  after = {
    "williamboman/mason.nvim"
  },
  cmd = {
    "DapContinue",
    "DapDisconnect",
    "DapEval",
    "DapInstall",
    "DapLoadLaunchJSON",
    "DapNew",
    "DapRestartFrame",
    "DapSetLogLevel",
    "DapShowLog",
    "DapStepInto",
    "DapStepOut",
    "DapStepOver",
    "DapTerminate",
    "DapToggleBreakpoint",
    "DapToggleRepl",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    local has_overseer, overseer = pcall(require, "overseer")
    if has_overseer then
      overseer.enable_dap()
    end

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    require("mason-nvim-dap").setup({
      ensure_installed = {},
      automatic_installation = true,
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
      }
    })
    dapui.setup()
  end,
  keys = {
    { "<F2>",  function() require("dap").toggle_breakpoint() end, desc = "[DBG] Toggle Breakpoint" },
    { "<F3>",  function() require("dapui").eval() end,            { "n", "v" },                    desc = "[DBG] Eval Code" },
    { "<F4>",  function() require("dap").terminate() end,         { "n", "v" },                    desc = "[DBG] Quit" },
    { "<F5>",  function() require("dap").continue() end,          desc = "[DBG] Continue" },
    { "<F17>", function() require("dapui").toggle() end,          desc = "[DBG] Toggle UI" },
  }
}
