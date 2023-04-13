vim.cmd.packadd("mason-tool-installer.nvim")

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
        "emmet-ls",
        "gopls",
        "html-lsp",
        "jdtls",
        "jedi-language-server",
        "rust-analyzer",
        "solidity",
        "solidity-ls",
        "texlab",
        "typescript-language-server",
        "vue-language-server",
        -- Linter
        "codespell",
        "flake8",
        -- Formatter
        "black",
        "clang-format",
        "goimports",
        "isort",
        "prettierd",
        "sql-formatter",
        "stylua",
        -- DAP
        "cpptools",
        "debugpy",
        "delve",
    },
})
