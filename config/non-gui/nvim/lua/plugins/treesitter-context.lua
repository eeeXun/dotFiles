require("treesitter-context").setup({
    max_lines = math.floor(vim.o.lines * 0.1),
    trim_scope = "inner",
})
