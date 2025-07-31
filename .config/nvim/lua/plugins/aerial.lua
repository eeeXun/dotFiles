local cmd = vim.cmd
local map = vim.keymap.set

require("aerial").setup({
    show_guides = true,
    keymaps = {
        ["<"] = "actions.prev",
        [">"] = "actions.next",
    },
    on_attach = function(bufnr)
        map("n", "<Leader>,", cmd.AerialPrev, { buffer = bufnr, desc = "Aerial Previous" })
        map("n", "<Leader>.", cmd.AerialNext, { buffer = bufnr, desc = "Aerial Next" })
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
