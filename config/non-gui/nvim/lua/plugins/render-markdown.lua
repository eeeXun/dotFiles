require("render-markdown").setup({
    anti_conceal = { disabled_modes = { "n" } },
    win_options = { concealcursor = { rendered = "n" } },
    overrides = {
        buflisted = { [true] = { enabled = false } },
    },
})
