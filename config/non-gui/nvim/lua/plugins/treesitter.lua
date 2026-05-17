local ensure_installed = {
    "asm",
    "bash",
    "bibtex",
    "c",
    "cmake",
    "comment",
    "cpp",
    "css",
    "csv",
    "diff",
    "dockerfile",
    "doxygen",
    "git_rebase",
    "gitcommit",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gotmpl",
    "groovy",
    "html",
    "http",
    "java",
    "javadoc",
    "javascript",
    "json",
    "latex",
    "linkerscript",
    "lua",
    "markdown",
    "markdown_inline",
    "printf",
    "python",
    "rasi",
    "rust",
    "scala",
    "solidity",
    "sql",
    "ssh_config",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
    "vue",
    "xresources",
    "yaml",
    "zathurarc",
    "zsh",
}

require("nvim-treesitter").install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
    callback = function(event)
        if not vim.tbl_contains(ensure_installed, vim.treesitter.language.get_lang(event.match)) then
            return
        end
        vim.treesitter.start()
        vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
