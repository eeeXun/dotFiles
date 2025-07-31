-- disable plugin
vim.g.loaded_netrw = 1
vim.g.loaded_matchparen = 1
vim.g.omni_sql_no_default_maps = 1

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
