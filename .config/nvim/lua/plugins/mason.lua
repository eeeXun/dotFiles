require("mason").setup({
    ui = {
        height = 0.75,
        border = "rounded",
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
        "rust-analyzer",
        "solidity",
        "solidity-ls",
        "texlab",
        "tailwindcss-language-server",
        "typescript-language-server",
        "typos-lsp",
        "vue-language-server",
        -- Linter
        "flake8",
        -- Formatter
        "asmfmt",
        "black",
        "clang-format",
        "goimports",
        "isort",
        "prettierd",
        "rustywind",
        "sql-formatter",
        "stylua",
        -- DAP
        "codelldb",
        "debugpy",
        "delve",
        "java-debug-adapter",
        "java-test",
    },
})
