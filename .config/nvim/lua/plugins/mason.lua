require("mason").setup({
    ui = {
        border = "rounded",
        check_outdated_packages_on_open = false,
    },
})

require("mason-tool-installer").setup({
    ensure_installed = {
        -- LSP
        "clangd",
        "cmake-language-server",
        "emmet-language-server",
        "gopls",
        "html-lsp",
        "jdtls",
        "jedi-language-server",
        "rust-analyzer",
        "solidity",
        "solidity-ls",
        "texlab",
        "tailwindcss-language-server",
        "typescript-language-server",
        "vue-language-server",
        -- Linter
        "codespell",
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
    },
})
