local cmp = require("cmp")

cmp.setup({
    preselect = cmp.PreselectMode.None,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = require("lspkind").cmp_format({
            maxwidth = { abbr = 30 },
            mode = "symbol_text",
            menu = {
                path = "[PATH]",
                buffer = "[BUF]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[LUA]",
                luasnip = "[SNIP]",
            },
            ellipsis_char = "…",
        }),
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i" }),
        ["<C-l>"] = cmp.mapping(function(fallback)
            if require("luasnip").expandable() then
                require("luasnip").expand()
            elseif cmp.visible() then
                cmp.confirm({ select = true })
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-j>"] = cmp.mapping(function(fallback)
            if require("luasnip").jumpable(1) then
                require("luasnip").jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
            if require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-f>"] = cmp.mapping.scroll_docs(-4),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lua" },
        {
            name = "buffer",
            option = {
                get_bufnrs = function()
                    local bufs = {}
                    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
                        local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(bufnr))
                        if vim.bo[bufnr].buflisted and (not stats or stats.size < 1e6) then
                            table.insert(bufs, bufnr)
                        end
                    end
                    return bufs
                end,
            },
        },
        { name = "path" },
    },
})

cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
    }),
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = nil
            return vim_item
        end,
    },
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline({
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
    }),
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = nil
            return vim_item
        end,
    },
    sources = {
        { name = "cmdline" },
    },
})
