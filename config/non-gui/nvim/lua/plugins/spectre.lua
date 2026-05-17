require("spectre").setup({
    open_cmd = "new",
    highlight = {
        search = "DiffDelete",
        replace = "DiffChange",
    },
    mapping = {
        ["resume_last_search"] = {
            map = "<Leader>rl",
            cmd = "<Cmd>lua require('spectre').resume_last_search()<CR>",
            desc = "resume last search before close",
        },
    },
})
