local cmd = vim.cmd
local map = vim.keymap.set

require("aerial").setup({
    show_guides = true,
    on_attach = function(bufnr)
        map("n", "{", cmd.AerialPrev, { buffer = bufnr })
        map("n", "}", cmd.AerialNext, { buffer = bufnr })
    end,
    layout = {
        max_width = 0.225,
        width = 0.225,
        min_width = nil,
        win_opts = {
            number = true,
            relativenumber = true,
        },
    },
})
