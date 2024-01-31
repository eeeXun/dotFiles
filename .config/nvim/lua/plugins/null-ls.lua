local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        -- assembly
        formatting.asmfmt,
        -- go
        formatting.goimports,
        -- js
        formatting.prettierd,
        formatting.rustywind,
        -- json
        formatting.jq,
        -- lua
        formatting.stylua,
        -- python
        diagnostics.flake8,
        formatting.black,
        formatting.isort,
        -- sql
        formatting.sql_formatter.with({
            generator_opts = {
                command = "sql-formatter",
                args = {
                    "--config",
                    os.getenv("HOME") .. "/.config/sql-formatter.json",
                },
                to_stdin = true,
            },
        }),
    },
})
