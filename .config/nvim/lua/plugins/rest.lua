require("rest-nvim").setup({
    result_split_horizontal = true,
    stay_in_current_window_after_split = true,
    formatters = {
        json = "jq",
        html = false,
    },
})
