local modules = {
    "impatient",
    "pluginList",
    "mappings",
    "utils",
    "autocmd",
}

for _, module in ipairs(modules) do
    -- require(module)
    pcall(require, module)
end
