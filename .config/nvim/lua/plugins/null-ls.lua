local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
        -- assembly
        formatting.asmfmt,
        -- go
        formatting.goimports,
        -- js
        formatting.prettierd,
        formatting.rustywind,
        -- lua
        formatting.stylua,
        -- python
        formatting.isort,
        -- sql
        diagnostics.sqlfluff,
        formatting.sqlfluff,
    },
})

null_ls.register({
    method = null_ls.methods.FORMATTING,
    filetypes = { "json" },
    generator = null_ls.formatter({
        command = "jq",
        to_stdin = true,
    }),
})

null_ls.register({
    method = null_ls.methods.FORMATTING,
    filetypes = { "tex" },
    generator = null_ls.formatter({
        command = "tex-fmt",
        args = { "-s" },
        to_stdin = true,
    }),
})
