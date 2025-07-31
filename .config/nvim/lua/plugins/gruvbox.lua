local colors = require("gruvbox").palette

require("gruvbox").setup({
    contrast = "hard",
    overrides = {
        NormalFloat = { link = "Normal" },
        WinSeparator = { link = "GruvboxBg3" },
        TreesitterContext = { link = "CursorLine" },
        QuickFixLine = { bg = "#6f5a2b" },
        DiffText = { link = "QuickFixLine" },
    },
})
