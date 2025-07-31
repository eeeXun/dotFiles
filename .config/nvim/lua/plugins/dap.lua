local dap, dapui = require("dap"), require("dapui")

vim.fn.sign_define("DapBreakpoint", { text = "🔴" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🔵" })
vim.fn.sign_define("DapStopped", { text = "🟢" })

dapui.setup({
    expand_lines = false,
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
            },
            position = "left",
            size = 0.3,
        },
        {
            elements = { { id = "console", size = 0.5 }, { id = "repl", size = 0.5 } },
            position = "bottom",
            size = 0.25,
        },
    },
})
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- c
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
    },
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.expand("%:p:h") .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
    },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- go
dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
    },
}
dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}",
    },
    {
        type = "delve",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${file}",
    },
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
    },
}

-- python
dap.adapters.python = {
    type = "executable",
    command = "debugpy-adapter",
}
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        console = "integratedTerminal",
        pythonPath = "python",
    },
}
