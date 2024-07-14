return { "mfussenegger/nvim-dap", 
config = function ()
    -- cpp debug on windows
    local dap = require('dap')
    -- dap.adapters.cppdbg = {
    --   id = 'cppdbg',
    --   type = 'executable',
    --   command = 'C:\\lib\\cppdap\\debugAdapters\\bin\\OpenDebugAD7.exe',
    --   options = {
    --     detached = false
    --   }
    -- }
dap.adapters.cppvsdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = 'C:\\lib\\cppdap\\debugAdapters\\bin\\OpenDebugAD7.exe',
  options = {
    detached = false
  },
}
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = 'C:\\lib\\lldb\\adapter\\codelldb.exe',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    detached = false,
  }
}

dap.adapters.gdb = {
  type = "executable",
  command = "C:\\lib\\MinGW\\bin\\gdb.exe",
  args = { "-i", "dap" }
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppvsdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    stopAtBeginningOfMainSubprogram = true,
    --MIDebuggerPath = "C:\\lib\\MinGW\\bin\\gdb.exe"
  },

}
end,

dependencies = {} }
