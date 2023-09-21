local modules = {
    "lazyList",
    "utils",
    "mappings",
    "autocmd",
}

for _, module in ipairs(modules) do
    -- require(module)
    pcall(require, module)
end
