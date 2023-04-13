local lspconfig = require("lspconfig")

vim.lsp.set_log_level("warn")

local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    float = {
        source = "always",
        border = "rounded",
    },
    virtual_text = {
        spacing = 2,
        prefix = "●",
        source = "always",
    },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    "clangd",
    "cmake",
    "emmet_ls",
    "gopls",
    "html",
    "jedi_language_server",
    "rust_analyzer",
    "solidity",
    "texlab",
    "tsserver",
    "volar",
}

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities,
    })
end
