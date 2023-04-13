require("bufferline").setup({
    options = {
        tab_size = 10,
        numbers = function(opts)
            return string.format("%s·", opts.raise(opts.id))
        end,
        modified_icon = "",
        buffer_close_icon = "",
        show_buffer_icons = false,
        show_close_icon = false,
        indicator = {
            icon = nil,
            style = "none",
        },
        separator_style = { nil, nil },
    },
    highlights = {
        background = {
            bg = { attribute = "fg", highlight = "GruvboxBg0" },
            fg = { attribute = "fg", highlight = "GruvboxFg4" },
        },
        buffer = {
            bg = { attribute = "fg", highlight = "GruvboxBg0" },
            fg = { attribute = "fg", highlight = "GruvboxFg4" },
        },
        buffer_selected = {
            bg = { attribute = "fg", highlight = "GruvboxFg4" },
            fg = { attribute = "fg", highlight = "GruvboxBg0" },
            bold = true,
            italic = false,
        },
        buffer_visible = {
            bg = { attribute = "fg", highlight = "GruvboxBg1" },
            fg = { attribute = "fg", highlight = "GruvboxFg4" },
        },
        close_button = {
            bg = { attribute = "fg", highlight = "GruvboxBg0" },
            fg = { attribute = "fg", highlight = "GruvboxNeutralRed" },
        },
        close_button_selected = {
            bg = { attribute = "fg", highlight = "GruvboxFg4" },
            fg = { attribute = "fg", highlight = "GruvboxNeutralRed" },
        },
        close_button_visible = {
            bg = { attribute = "fg", highlight = "GruvboxBg1" },
            fg = { attribute = "fg", highlight = "GruvboxNeutralRed" },
        },
        duplicate = {
            bg = { attribute = "fg", highlight = "GruvboxBg0" },
            fg = { attribute = "fg", highlight = "GruvboxFg4" },
            bold = true,
        },
        duplicate_selected = {
            bg = { attribute = "fg", highlight = "GruvboxFg4" },
            fg = { attribute = "fg", highlight = "GruvboxBg0" },
            bold = true,
            italic = false,
        },
        duplicate_visible = {
            bg = { attribute = "fg", highlight = "GruvboxBg1" },
            fg = { attribute = "fg", highlight = "GruvboxFg4" },
            bold = true,
        },
        indicator_selected = {
            bg = { attribute = "fg", highlight = "GruvboxFg4" },
            fg = { attribute = "fg", highlight = "GruvboxBg0" },
        },
        indicator_visible = {
            bg = { attribute = "fg", highlight = "GruvboxBg1" },
            fg = { attribute = "fg", highlight = "GruvboxFg4" },
        },
        modified = {
            bg = { attribute = "fg", highlight = "GruvboxBg0" },
            fg = { attribute = "fg", highlight = "GruvboxFadedBlue" },
        },
        modified_selected = {
            bg = { attribute = "fg", highlight = "GruvboxFg4" },
            fg = { attribute = "fg", highlight = "GruvboxFadedBlue" },
        },
        modified_visible = {
            bg = { attribute = "fg", highlight = "GruvboxBg1" },
            fg = { attribute = "fg", highlight = "GruvboxFadedBlue" },
        },
        numbers = {
            bg = { attribute = "fg", highlight = "GruvboxBg0" },
            fg = { attribute = "fg", highlight = "GruvboxFg4" },
        },
        numbers_selected = {
            bg = { attribute = "fg", highlight = "GruvboxFg4" },
            fg = { attribute = "fg", highlight = "GruvboxBg0" },
            bold = true,
            italic = false,
        },
        numbers_visible = {
            bg = { attribute = "fg", highlight = "GruvboxBg1" },
            fg = { attribute = "fg", highlight = "GruvboxFg4" },
        },
        separator = {
            bg = { attribute = "fg", highlight = "GruvboxBg0" },
            fg = { attribute = "fg", highlight = "GruvboxFg4" },
        },
        separator_selected = {
            bg = { attribute = "fg", highlight = "GruvboxFg4" },
            fg = { attribute = "fg", highlight = "GruvboxBg0" },
        },
        separator_visible = {
            bg = { attribute = "fg", highlight = "GruvboxBg1" },
            fg = { attribute = "fg", highlight = "GruvboxFg4" },
        },
    },
})
