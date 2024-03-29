require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "bibtex",
        "c",
        "cmake",
        "cpp",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "html",
        "http",
        "java",
        "javascript",
        "json",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "rasi",
        "rust",
        "scala",
        "solidity",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
    },
    highlight = {
        enable = true,
        disable = { "latex" },
    },
})
