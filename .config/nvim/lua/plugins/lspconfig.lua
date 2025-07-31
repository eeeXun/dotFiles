local lsp = vim.lsp

lsp.set_log_level("OFF")

vim.diagnostic.config({
    float = { source = true },
    virtual_text = {
        spacing = 2,
        prefix = "●",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
            [vim.diagnostic.severity.INFO] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        },
    },
})

lsp.enable({
    "clangd",
    "emmet_language_server",
    "gopls",
    "html",
    "jedi_language_server",
    "neocmake",
    "ruff",
    "rust_analyzer",
    "solidity_ls",
    "tailwindcss",
    "taplo",
    "texlab",
    "typos_lsp",
    "vtsls",
    "vue_ls",
})
lsp.config("*", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(lsp.protocol.make_client_capabilities()),
})

lsp.config("typos_lsp", {
    filetypes = { "gitcommit", "markdown", "tex", "text" },
})

lsp.config("vtsls", {
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = vim.fn.expand(
                            "$MASON/packages/vue-language-server/node_modules/@vue/language-server"
                        ),
                        languages = { "vue" },
                        configNamespace = "typescript",
                    },
                },
            },
        },
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
    },
})
