require'utils'

M = {}
-- FZTerm
M.fzterm = function()
  map("n", "<leader>f", ":silent! FilesOrGFiles<CR>", {})
  map("n", "<leader>F", ":silent! Files<CR>", {})
  map("n", "<leader>a", ":silent! Ag<CR>", {})
  map("n", "<leader>r", ":silent! Rg<CR>", {})
  map("n", "<leader>b", ":silent! Buffers<CR>", {})
  map("n", "<leader>ls", ":silent! DocumentSymbols<CR>", {})
  map("n", "<leader>lw", ":silent! WorkspaceSymbols<CR>", {})
  map("n", "<leader>lr", ":silent! References<CR>", {})
  map("n", "<leader>r", ":silent! Ranger<CR>", {})
  vim.g.fzterm_ignore = {
    ".git",
    ".node_modules"
  }
end

-- Pear tree
M.pearTree = function()
  vim.g.pear_tree_smart_openers = true
  vim.g.pear_tree_smart_closers = true
  vim.g.pear_tree_smart_backspace = true
end

-- DAP
M.dap = function()
  local dap = require'dap'
  dap.adapters.cpp = {
    type = 'executable',
    attach = {
      pidProperty = 'pid',
      pidSelect = 'ask'
    },
    command = 'lldb-vscode',
    env = {
      LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = 'YES'
    },
    name = 'lldb'
  }
  vim.g.dap_virtual_text = true
  map("n", "<F5>", ":lua require'dap'.toggle_breakpoint()<CR>", {noremap = true, silent = true})
  map("n", "<F6>", ":lua require'dap'.step_over()<CR>", {noremap = true, silent = true})
  map("n", "<F18>", ":lua require'dap'.step_back()<CR>", {noremap = true, silent = true})
  map("n", "<F30>", ":lua require'dap'.goto_()<CR>", {noremap = true, silent = true})
  map("n", "<F4>", ":DbgC ", {noremap = true, silent = true})
  map("n", "<F16>", ":lua require'dap'.repl.close()<CR>", {noremap = true, silent = true})
  vim.cmd("command! -nargs=1 DbgC lua require'plugins.misc'.start_c_debugger({<f-args>})")
end

local last_gdb_config
M.start_c_debugger = function(args, mi_mode, mi_debugger_path)
    local dap = require "dap"
    if args and #args > 0 then
        last_gdb_config = {
            type = "cpp",
            name = args[1],
            request = "launch",
            program = table.remove(args, 1),
            args = args,
            cwd = vim.fn.getcwd(),
            env = {"VAR1=value1", "VAR2=value"}, -- environment variables are set via `ENV_VAR_NAME=value` pairs
            externalConsole = true,
            MIMode = mi_mode or "gdb",
            MIDebuggerPath = mi_debugger_path
          }
    end

    if not last_gdb_config then
        print('No binary to debug set! Use ":DebugC <binary> <args>" or ":DebugRust <binary> <args>"')
        return
    end

    dap.run(last_gdb_config)
    dap.repl.open()
end


return M
