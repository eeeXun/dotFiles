local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local spell_file = { "gitcommit", "markdown", "tex", "text" }

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
        -- spell
        diagnostics.codespell.with({
            filetypes = spell_file,
        }),
        formatting.codespell.with({
            filetypes = spell_file,
        }),
        -- sql
        formatting.sql_formatter,
    },
})
