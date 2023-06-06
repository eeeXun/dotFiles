require("toggleterm").setup({
    hide_numbers = false,
    persist_size = false,
    start_in_insert = false,
    shade_terminals = false,
    highlights = {
        Normal = {
            link = "Normal",
        },
        NormalFloat = {
            link = "Normal",
        },
    },
    size = function(term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.25
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end,
    float_opts = {
        border = "curved",
        width = function()
            return math.floor(vim.o.columns * 0.6)
        end,
        height = function()
            return math.floor(vim.o.lines * 0.6)
        end,
    },
})
