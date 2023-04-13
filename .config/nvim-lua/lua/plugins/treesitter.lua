require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "cpp",
        "diff",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "html",
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
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
    },
    highlight = {
        enable = true,
        disable = { "latex" },
    },
})