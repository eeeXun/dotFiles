require("rest-nvim").setup({
    result_split_horizontal = true,
    result_split_in_place = true,
    formatters = {
        json = "jq",
        html = false,
    },
})
