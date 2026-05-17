require("gruvbox").setup({
    contrast = "hard",
    overrides = {
        NormalFloat = { link = "Normal" },
        WinBar = { link = "WinBarNC" },
        WinSeparator = { link = "GruvboxBg3" },
        TreesitterContext = { link = "CursorLine" },
        QuickFixLine = { bg = "#6f5a2b" },
        DiffText = { link = "QuickFixLine" },
        RestPaneTitleNC = { link = "Normal" },
        UndotreeSeq = { link = "Comment" },
        UndotreeCurrent = { link = "Statement" },
        UndotreeSavedCur = { link = "MatchParen" },
        UndotreeTimeStamp = { link = "Function" },
    },
})
