local modules = {
    "lazyList",
    "utils",
    "keymaps",
    "autocmd",
}

for _, module in ipairs(modules) do
    -- require(module)
    pcall(require, module)
end
