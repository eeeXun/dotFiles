local colors = require("gruvbox").palette

require("gruvbox").setup({
    contrast = "hard",
    overrides = {
        GruvboxBrightRed = { fg = colors.bright_red },
        GruvboxBrightGreen = { fg = colors.bright_green },
        GruvboxBrightYellow = { fg = colors.bright_yellow },
        GruvboxBrightBlue = { fg = colors.bright_blue },
        GruvboxBrightPurple = { fg = colors.bright_purple },
        GruvboxBrightAqua = { fg = colors.bright_aqua },
        GruvboxBrightOrange = { fg = colors.bright_orange },
        GruvboxFadedRed = { fg = colors.faded_red },
        GruvboxFadedGreen = { fg = colors.faded_green },
        GruvboxFadedYellow = { fg = colors.faded_yellow },
        GruvboxFadedBlue = { fg = colors.faded_blue },
        GruvboxFadedPurple = { fg = colors.faded_purple },
        GruvboxFadedAqua = { fg = colors.faded_aqua },
        GruvboxFadedOrange = { fg = colors.faded_orange },
        GruvboxNeutralRed = { fg = colors.neutral_red },
        GruvboxNeutralGreen = { fg = colors.neutral_green },
        GruvboxNeutralYellow = { fg = colors.neutral_yellow },
        GruvboxNeutralBlue = { fg = colors.neutral_blue },
        GruvboxNeutralPurple = { fg = colors.neutral_purple },
        GruvboxNeutralAqua = { fg = colors.neutral_aqua },
        QuickFixLine = { link = "DiffText" },
        WinSeparator = { link = "GruvboxBg3" },
    },
})
