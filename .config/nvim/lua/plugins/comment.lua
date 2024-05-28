local ft = require("Comment.ft")

ft.set("asm", "#%s")
ft.set("zathurarc", "#%s")

require("Comment").setup({
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})
