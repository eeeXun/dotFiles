local fn = vim.fn
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local lsp = vim.lsp.buf
local notify = vim.notify
local map = vim.keymap.set
local diagnostic = vim.diagnostic
local lsp_request = vim.lsp.buf_request
local lsp_params = vim.lsp.util.make_position_params

local filetypedetect = augroup("FiletypeDetect", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "go.mod",
    group = filetypedetect,
    callback = function()
        vim.opt_local.filetype = "gomod"
    end,
})
autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "go.sum",
    group = filetypedetect,
    callback = function()
        vim.opt_local.filetype = "gosum"
    end,
})
autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.rasi",
    group = filetypedetect,
    callback = function()
        vim.opt_local.filetype = "rasi"
    end,
})

-- last-position-jump
autocmd("BufReadPost", {
    callback = function()
        if fn.line("'\"") > 1 and fn.line("'\"") <= fn.line("$") then
            cmd.normal({ 'g`"', bang = true })
        end
    end,
})

-- hlsearch
local toggle_hlsearch = augroup("ToggleHLSearch", { clear = true })
autocmd("CmdlineEnter", {
    pattern = { "/", "\\?" },
    group = toggle_hlsearch,
    callback = function()
        vim.opt.hlsearch = true
    end,
})
autocmd("CmdlineLeave", {
    pattern = { "/", "\\?" },
    group = toggle_hlsearch,
    callback = function()
        vim.opt.hlsearch = false
    end,
})

-- help
autocmd("BufWinEnter", {
    callback = function()
        if vim.bo.filetype == "help" then
            cmd.resize(tostring(math.floor(vim.o.lines * 0.5)))
        end
    end,
})

-- nvim-tree
autocmd("BufEnter", {
    nested = true,
    callback = function()
        if fn.winnr("$") == 1 and fn.bufname() == "NvimTree_" .. fn.tabpagenr() then
            cmd.quit()
        end
    end,
})
autocmd("VimEnter", {
    callback = function()
        if fn.argc() == 1 and fn.isdirectory(fn.argv()[1]) ~= 0 then
            cmd.NvimTreeOpen(fn.argv()[1])
            return true
        end
    end,
})
autocmd("BufEnter", {
    callback = function(data)
        if fn.isdirectory(data.file) ~= 0 then
            cmd.NvimTreeOpen(data.file)
            return true
        end
    end,
})

-- lsp
autocmd("LspAttach", {
    group = augroup("LspConfig", { clear = true }),
    callback = function(args)
        local opts = { noremap = true, silent = true, buffer = args.buf }
        map("n", "K", lsp.hover, opts)
        map("n", "<Leader>rn", lsp.rename, opts)
        map("n", "<C-k>", lsp.signature_help, opts)
        map("n", "<C-k>", lsp.signature_help, opts)
        map("n", "<space>ca", lsp.code_action, opts)
        map("n", "<Leader>gr", function()
            lsp_request(0, "textDocument/references", lsp_params(0), function(_, result, _, _)
                if not result then
                    notify("No lsp reference!")
                    return
                end

                if #result > 1 then
                    cmd.Telescope("lsp_references")
                else
                    cmd.vsplit()
                    lsp.references()
                end
            end)
        end, opts)
        map("n", "<Leader>gi", function()
            lsp_request(0, "textDocument/implementation", lsp_params(0), function(_, result, _, _)
                if not result then
                    notify("No lsp implementation!")
                    return
                end

                if #result > 1 then
                    cmd.Telescope("lsp_implementations")
                else
                    cmd.vsplit()
                    lsp.implementation()
                end
            end)
        end, opts)
        map("n", "<Leader>gd", function()
            lsp_request(0, "textDocument/definition", lsp_params(0), function(_, result, _, _)
                if not result then
                    notify("No lsp definition!")
                    return
                end

                if #result > 1 then
                    cmd.Telescope("lsp_definitions")
                else
                    cmd.vsplit()
                    lsp.definition()
                end
            end)
        end, opts)
        map("n", "[d", diagnostic.goto_prev, opts)
        map("n", "]d", diagnostic.goto_next, opts)
        map("n", "<Leader>e", diagnostic.open_float, opts)
        map("n", "<Leader>q", diagnostic.setloclist, opts)
        map("n", "<Leader>fm", function()
            lsp.format({
                async = true,
                filter = function(client)
                    return client.name ~= "tsserver"
                end,
            })
        end, opts)
    end,
})
