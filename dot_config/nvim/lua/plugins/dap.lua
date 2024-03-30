return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "jay-babu/mason-nvim-dap.nvim",
    "nvim-neotest/nvim-nio"
  },
  after = {
    "williamboman/mason.nvim"
  },
  event = "VeryLazy",
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

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
      handlers = {
        function(config)
          require('mason-nvim-dap').default_setup(config)
        end,
      }
    })
    dapui.setup()
  end,
  keys = {
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "[DBG] Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end,          desc = "[DBG] Continue" },
    { "<leader>dd", function() require("dapui").toggle() end,          desc = "[DBG] Toggle UI" },
    { "<leader>dx", function() require("dapui").eval() end,            { "n", "v" },                    desc = "[DBG] Eval Code" }
  }
}
