vim.g.mapleader = " "
local fn = vim.fn
local api = vim.api
local cwd = "%:p:h"
local cmd = vim.cmd
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- normal
map("i", "<C-c>", cmd.stopinsert, opts)
map("n", "r<C-c>", cmd.stopinsert, opts)
map("v", "<Tab>", ">gv=gv", opts)
map("v", "<S-Tab>", "<gv=gv", opts)
map("v", "<Leader>y", '"+y', opts)
map("n", "<Leader>a", "gg0vG$", opts)
map("n", "ZA", cmd.quitall, opts)
map("v", "J", ":move '>+1<CR>gv=gv", opts)
map("v", "K", ":move '<-2<CR>gv=gv", opts)
map("n", "<Leader>m", cmd.write, opts)
map("n", "<Leader>phw", function()
    cmd.help(fn.expand("<cword>"))
end, opts)

-- buffer
map("n", "<C-l>", cmd.bnext, opts)
map("n", "<C-h>", cmd.bprevious, opts)
map("n", "<Leader>bd", cmd.bdelete, opts)

-- window
map("n", "<Leader>h", function()
    cmd.wincmd("h")
end, opts)
map("n", "<Leader>j", function()
    cmd.wincmd("j")
end, opts)
map("n", "<Leader>k", function()
    cmd.wincmd("k")
end, opts)
map("n", "<Leader>l", function()
    cmd.wincmd("l")
end, opts)
map("n", "<Leader>+", function()
    cmd.resize("+5")
end, opts)
map("n", "<Leader>_", function()
    cmd.resize("-5")
end, opts)
map("n", "<Leader>=", function()
    cmd.resize({ "+5", mods = { vertical = true } })
end, opts)
map("n", "<Leader>-", function()
    cmd.resize({ "-5", mods = { vertical = true } })
end, opts)

-- diff
map({ "n", "v" }, "<Leader>dg", cmd.diffget, opts)
map({ "n", "v" }, "<Leader>dp", cmd.diffput, opts)
map({ "n", "v" }, "<Leader>dh", function()
    cmd.diffget("//2")
end, opts)
map({ "n", "v" }, "<Leader>dl", function()
    cmd.diffget("//3")
end, opts)

-- terminal
map("t", "<C-\\>", "<C-\\><C-n>", opts)
map("n", "<Leader>``", function()
    cmd.ToggleTerm({ args = { "dir=" .. cwd, "direction=float" } })
end, opts)
map("n", "<Leader>`l", function()
    cmd.ToggleTerm({ args = { "dir=" .. cwd, "direction=vertical" } })
end, opts)
map("n", "<Leader>`j", function()
    cmd.ToggleTerm({ args = { "dir=" .. cwd, "direction=horizontal" } })
end, opts)

-- undotree
map("n", "<Leader>u", cmd.UndotreeToggle, opts)

-- fugitive
map("n", "<Leader>gs", cmd.Git, opts)
map("n", "<Leader>cm", cmd.Gclog, opts)

-- telescope
map("n", "<Leader>bb", function()
    cmd.Telescope("buffers")
end, opts)
map("n", "<C-p>", function()
    cmd.Telescope({ args = { "git_files", "cwd=" .. cwd } })
end, opts)
map("n", "<Leader>ff", function()
    cmd.Telescope({ args = { "find_files", "cwd=" .. cwd } })
end, opts)
map("n", "<Leader>fb", function()
    cmd.Telescope({ args = { "file_browser", "cwd=" .. cwd } })
end, opts)
map("n", "<Leader>ps", function()
    cmd.Telescope({ args = { "live_grep", "cwd=" .. cwd } })
end, opts)
map("n", "<Leader>pw", function()
    cmd.Telescope({ args = { "grep_string", "cwd=" .. cwd } })
end, opts)
map("n", "<Leader>gm", function()
    cmd.Telescope({ args = { "git_commits", "cwd=" .. cwd } })
end, opts)
map("n", "<Leader>gb", function()
    cmd.Telescope({ args = { "git_branches", "cwd=" .. cwd } })
end, opts)

-- nvimtree
map("n", "<Leader>n", cmd.NvimTreeToggle, opts)

-- spectre
map("n", "<Leader>ss", function()
    require("spectre").open()
end, opts)
map("n", "<Leader>sw", function()
    require("spectre").open_visual({ select_word = true })
end, opts)

-- trouble
map("n", "<Leader>tt", cmd.TroubleToggle, opts)
map("n", "<Leader>tf", function()
    cmd.TroubleToggle("document_diagnostics")
end, opts)
map("n", "<Leader>tw", function()
    cmd.TroubleToggle("workspace_diagnostics")
end, opts)

-- aerial
map("n", "<Leader>o", cmd.AerialToggle, opts)

-- dap
map("n", "<Leader>bp", require("dap").toggle_breakpoint, opts)
map("n", "<Leader>cn", require("dap").continue, opts)
map("n", "<Leader>sp", require("dap").step_over, opts)
map("n", "<Leader>dt", require("dap").terminate, opts)

local exec_program = {
    ["c"] = function()
        cmd.TermExec("cmd='gcc %:p -o /tmp/a.out && /tmp/a.out'")
    end,
    ["cpp"] = function()
        cmd.TermExec("cmd='g++ %:p -o /tmp/a.out && /tmp/a.out'")
    end,
    ["go"] = function()
        cmd.TermExec("cmd='go run %:p'")
    end,
    ["html"] = function()
        vim.fn.jobstart({ "firefox", vim.fn.expand("%") }, { detach = true })
    end,
    ["java"] = function()
        cmd.TermExec("cmd='javac %:p && java %:t:r'")
    end,
    ["markdown"] = function()
        cmd.MarkdownPreviewToggle()
    end,
    ["python"] = function()
        cmd.TermExec("cmd='python3 %:p'")
    end,
    ["rust"] = function()
        cmd.TermExec("cmd='rustc %:p -o /tmp/a.out && /tmp/a.out'")
    end,
    ["sh"] = function()
        cmd.TermExec("cmd='%:p'")
    end,
}
map("n", "<F5>", function()
    if exec_program[vim.bo.filetype] then
        cmd.write()
        exec_program[vim.bo.filetype]()
    else
        vim.notify(string.format("File type [%s] is not in execute list!", vim.bo.filetype))
    end
end, opts)

vim.t.is_transparent = false
local function toggle_transparent()
    if not vim.t.is_transparent then
        api.nvim_set_hl(0, "Normal", { bg = nil })
        api.nvim_set_hl(0, "WinSeparator", { link = "GruvboxBg3" })
        vim.t.is_transparent = true
    else
        vim.opt.background = "dark"
        vim.t.is_transparent = false
    end
end
map("n", "<F2>", toggle_transparent, opts)
