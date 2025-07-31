require("mason").setup({
    ui = {
        height = 0.75,
        check_outdated_packages_on_open = false,
    },
})

require("mason-tool-installer").setup({
    ensure_installed = {
        -- LSP
        "clangd",
        "emmet-language-server",
        "gopls",
        "html-lsp",
        "jdtls",
        "jedi-language-server",
        "neocmakelsp",
        "ruff",
        "rust-analyzer",
        "tailwindcss-language-server",
        "taplo",
        "texlab",
        "typos-lsp",
        "vscode-solidity-server",
        "vtsls",
        "vue-language-server",
        -- Formatter
        "asmfmt",
        "goimports",
        "isort",
        "prettierd",
        "rustywind",
        "stylua",
        "tex-fmt",
        -- Linter
        "sqlfluff",
        -- DAP
        "codelldb",
        "debugpy",
        "delve",
        "java-debug-adapter",
        "java-test",
    },
})
