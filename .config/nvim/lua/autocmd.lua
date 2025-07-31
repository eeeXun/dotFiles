local fn = vim.fn
local api = vim.api
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = true, desc = desc })
end

-- scrolloff
autocmd({ "VimEnter", "VimResized" }, {
    callback = function()
        vim.opt.scrolloff = math.floor(vim.o.lines * 0.2)
    end,
})

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
        if vim.bo.filetype == "help" and vim.fn.winheight(0) < vim.o.lines - 4 then
            api.nvim_win_set_height(0, math.floor(vim.o.lines * 0.5))
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
autocmd("BufEnter", {
    callback = function(data)
        local stats = vim.uv.fs_stat(data.file)
        if stats and stats.type == "directory" then
            cmd.NvimTreeOpen(data.file)
            return true
        end
    end,
})

-- terminal
autocmd("TermOpen", {
    callback = function()
        vim.wo.number = true
        vim.wo.relativenumber = true
    end,
})

-- quit
autocmd("FileType", {
    pattern = { "dap-float", "help", "qf", "query", "rest_nvim_result" },
    callback = function()
        map("n", "q", function()
            api.nvim_win_close(0, false)
        end, "Quit")
    end,
})

-- lsp
autocmd("LSPAttach", {
    group = augroup("LSPConfig", { clear = true }),
    callback = function()
        local lsp = vim.lsp.buf
        local diagnostic = vim.diagnostic
        map("n", "<Leader>rn", lsp.rename, "LSP rename")
        map("n", "<C-k>", lsp.signature_help, "LSP signature help")
        map("n", "<space>ca", lsp.code_action, "LSP code action")
        map("n", "<Leader>gr", function()
            cmd.Telescope({ args = { "lsp_references", "jump_type=vsplit" } })
        end, "LSP reference")
        map("n", "<Leader>gi", function()
            cmd.Telescope({ args = { "lsp_implementations", "jump_type=vsplit" } })
        end, "LSP implementation")
        map("n", "<Leader>gd", function()
            cmd.Telescope({ args = { "lsp_definitions", "jump_type=vsplit" } })
        end, "LSP definition")
        map("n", "<Leader>smm", function()
            cmd.Telescope({ args = { "lsp_document_symbols" } })
        end, "LSP symbols")
        map("n", "<Leader>smw", function()
            cmd.Telescope({ args = { "lsp_dynamic_workspace_symbols" } })
        end, "LSP workspace symbols")
        map("n", "<Leader>e", diagnostic.open_float, "LSP diagnostic float window")
        map("n", "<Leader>q", diagnostic.setloclist, "LSP diagnostic list")
        map("n", "<Leader>fm", function()
            lsp.format({
                async = true,
                filter = function(client)
                    return client.name ~= "vtsls"
                end,
            })
        end, "LSP format")
    end,
})
