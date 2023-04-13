require("nvim-tree.view").View.winopts.cursorlineopt = "number"

require("nvim-tree").setup({
    git = {
        ignore = false,
    },
    view = {
        number = true,
        relativenumber = true,
        signcolumn = "no",
        width = "22.5%",
        mappings = {
            custom_only = false,
            list = {
                { key = "+", action = "cd" },
            },
        },
    },
    renderer = {
        icons = {
            glyphs = {
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        indent_markers = {
            enable = true,
        },
    },
})
