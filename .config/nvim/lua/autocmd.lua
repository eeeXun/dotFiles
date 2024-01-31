local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local lsp = vim.lsp.buf
local diagnostic = vim.diagnostic
local lsp_request = vim.lsp.buf_request
local lsp_params = vim.lsp.util.make_position_params

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = true, desc = desc })
end

local function notify_error(msg)
    vim.notify(msg, vim.log.levels.ERROR)
end

-- last-position-jump
autocmd("BufReadPost", {
    callback = function()
        local mark = api.nvim_buf_get_mark(0, '"')
        if mark[1] > 1 and mark[1] <= api.nvim_buf_line_count(0) then
            api.nvim_win_set_cursor(0, mark)
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

-- quit
autocmd("FileType", {
    pattern = { "dap-float", "help", "qf" },
    callback = function()
        map("n", "q", function()
            api.nvim_win_close(0, false)
        end, "Quit")
    end,
})

-- lsp
autocmd("LspAttach", {
    group = augroup("LspConfig", { clear = true }),
    callback = function()
        map("n", "K", lsp.hover, "Lsp hover")
        map("n", "<Leader>rn", lsp.rename, "Lsp rename")
        map("n", "<C-k>", lsp.signature_help, "Lsp signature help")
        map("n", "<space>ca", lsp.code_action, "Lsp code action")
        map("n", "<Leader>gr", function()
            lsp_request(0, "textDocument/references", lsp_params(0), function(_, result, _, _)
                if not result then
                    notify_error("No lsp reference!")
                    return
                end

                if #result == 1 then
                    cmd.vsplit()
                end
                cmd.Telescope("lsp_references")
            end)
        end, "Lsp reference")
        map("n", "<Leader>gi", function()
            lsp_request(0, "textDocument/implementation", lsp_params(0), function(_, result, _, _)
                if not result then
                    notify_error("No lsp implementation!")
                    return
                end

                if #result > 1 then
                    cmd.Telescope("lsp_implementations")
                else
                    cmd.vsplit()
                    lsp.implementation()
                end
            end)
        end, "Lsp implementation")
        map("n", "<Leader>gd", function()
            lsp_request(0, "textDocument/definition", lsp_params(0), function(_, result, _, _)
                if not result then
                    notify_error("No lsp definition!")
                    return
                end

                if #result > 1 then
                    cmd.Telescope("lsp_definitions")
                else
                    cmd.vsplit()
                    lsp.definition()
                end
            end)
        end, "Lsp definition")
        map("n", "[d", diagnostic.goto_prev, "Lsp diagnostic previous")
        map("n", "]d", diagnostic.goto_next, "Lsp diagnostic next")
        map("n", "<Leader>e", diagnostic.open_float, "Lsp diagnostic float window")
        map("n", "<Leader>q", diagnostic.setloclist, "Lsp diagnostic list")
        map("n", "<Leader>fm", function()
            lsp.format({
                async = true,
                filter = function(client)
                    return client.name ~= "tsserver"
                end,
            })
        end, "Lsp format")
    end,
})
