vim.g.mapleader = " "
local fn = vim.fn
local api = vim.api
local cwd = "%:p:h"
local cmd = vim.cmd

local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
end

-- normal
map("i", "<C-c>", "<Esc>")
map("n", "r<C-c>", "<Esc>")
map("v", "<Tab>", ">gv=gv")
map("v", "<S-Tab>", "<gv=gv")
map("v", "<Leader>y", '"+y', "Yank to clipboard")
map("n", "<Leader>a", "gg0vG$", "Select all")
map("n", "ZA", cmd.quitall, "Quit all")
map("v", "J", ":move '>+1<CR>gv=gv", "Move line up")
map("v", "K", ":move '<-2<CR>gv=gv", "Move line down")
map("n", "<Leader>m", cmd.update, "Write")
map("n", "<Leader>phw", function()
    cmd.help(fn.expand("<cword>"))
end, "Help current word")

-- buffer
map("n", "<C-l>", cmd.bnext, "Next buffer")
map("n", "<C-h>", cmd.bprevious, "Previous buffer")
map("n", "<Leader>bd", cmd.bdelete, "Delete buffer")

-- window
map("n", "<Leader>h", function()
    cmd.wincmd("h")
end, "Select window left")
map("n", "<Leader>j", function()
    cmd.wincmd("j")
end, "Select window below")
map("n", "<Leader>k", function()
    cmd.wincmd("k")
end, "Select window above")
map("n", "<Leader>l", function()
    cmd.wincmd("l")
end, "Select window right")
map("n", "<Leader>+", function()
    cmd.resize("+5")
end, "Increase window height")
map("n", "<Leader>_", function()
    cmd.resize("-5")
end, "Decrease window height")
map("n", "<Leader>=", function()
    cmd.resize({ "+5", mods = { vertical = true } })
end, "Increase window width")
map("n", "<Leader>-", function()
    cmd.resize({ "-5", mods = { vertical = true } })
end, "Decrease window width")

-- diff
map({ "n", "v" }, "<Leader>dg", cmd.diffget, "Get difference")
map({ "n", "v" }, "<Leader>dp", cmd.diffput, "Put difference")
map({ "n", "v" }, "<Leader>dh", function()
    cmd.diffget("//2")
end, "Get difference left")
map({ "n", "v" }, "<Leader>dl", function()
    cmd.diffget("//3")
end, "Get difference right")

-- terminal
map("t", "<C-\\>", "<C-\\><C-n>", "Normal mode")
map("n", "<Leader>``", function()
    cmd.ToggleTerm({ args = { "dir=" .. fn.expand(cwd), "direction=float" } })
end, "Terminal float")
map("n", "<Leader>`l", function()
    cmd.ToggleTerm({ args = { "dir=" .. fn.expand(cwd), "direction=vertical" } })
end, "Terminal right")
map("n", "<Leader>`j", function()
    cmd.ToggleTerm({ args = { "dir=" .. fn.expand(cwd), "direction=horizontal" } })
end, "Terminal below")

-- undotree
map("n", "<Leader>u", cmd.UndotreeToggle, "Toggle undo tree")

-- zen-mode
map("n", "<Leader>cn", cmd.ZenMode, "Toggle center window")

-- neogen
map("n", "<Leader>ga", cmd.Neogen, "Generate annotation")

-- fugitive
map("n", "<Leader>gs", cmd.Git, "Git status")
map("n", "<Leader>cm", cmd.Gclog, "Git log")

-- telescope
map("n", "<Leader>?", function()
    cmd.Telescope("keymaps")
end, "Keymap menu")
map("n", "<Leader>tm", function()
    cmd.Telescope("marks")
end, "Telescope marks")
map("n", "<Leader>bb", function()
    cmd.Telescope("buffers")
end, "Telescope buffers")
map("n", "<C-p>", function()
    cmd.Telescope({ args = { "git_files", "cwd=" .. fn.expand(cwd) } })
end, "Telescope git files")
map("n", "<Leader>ff", function()
    cmd.Telescope({ args = { "find_files", "cwd=" .. fn.expand(cwd) } })
end, "Telescope files")
map("n", "<Leader>fb", function()
    cmd.Telescope({ args = { "file_browser", "cwd=" .. fn.expand(cwd) } })
end, "Telescope file browser")
map("n", "<Leader>ps", function()
    cmd.Telescope({ args = { "live_grep", "cwd=" .. fn.expand(cwd) } })
end, "Find word")
map("n", "<Leader>pw", function()
    cmd.Telescope({ args = { "grep_string", "cwd=" .. fn.expand(cwd) } })
end, "Find current word")
map("n", "<Leader>gm", function()
    cmd.Telescope({ args = { "git_commits", "cwd=" .. fn.expand(cwd) } })
end, "Telescope git commits")
map("n", "<Leader>gb", function()
    cmd.Telescope({ args = { "git_branches", "cwd=" .. fn.expand(cwd) } })
end, "Telescope git branches")

-- nvimtree
map("n", "<Leader>n", cmd.NvimTreeToggle, "Toggle file tree")

-- spectre
map("n", "<Leader>ss", function()
    require("spectre").open()
end, "Replace word")
map("n", "<Leader>sw", function()
    require("spectre").open_visual({ select_word = true })
end, "Replace current word")

-- trouble
map("n", "<Leader>tt", function()
    cmd.Trouble({ args = { "diagnostics", "toggle", "filter.buf=0" } })
end, "Toggle diagnostics list")
map("n", "<Leader>tw", function()
    cmd.Trouble({ args = { "diagnostics", "toggle" } })
end, "Toggle workspace diagnostics list")

-- todo
map("n", "<Leader>tdt", cmd.TodoTrouble, "Todo Trouble")
map("n", "<Leader>tds", cmd.TodoTelescope, "Todo Telescope")

-- aerial
map("n", "<Leader>o", cmd.AerialToggle, "Toggle symbol line")

-- dap
map("n", "<Leader>bp", function()
    require("dap").toggle_breakpoint()
end, "Toggle debug breakpoint")
map("n", "<Leader>dcl", function()
    require("dap").clear_breakpoints()
end, "Clear debug breakpoints")
map("n", "<F9>", function()
    require("dap").continue()
end, "Debug continue")
map("n", "<F10>", function()
    require("dap").step_over()
end, "Debug step over")
map("n", "<F11>", function()
    require("dap").step_into()
end, "Debug step into")
map("n", "<F12>", function()
    require("dap").step_out()
end, "Debug step out")
map("n", "<F8>", function()
    require("dap").terminate()
end, "Debug terminate")
map("n", "<Leader>dK", function()
    require("dap.ui.widgets").hover()
end, "Debug current word")
map("n", "<Leader>du", function()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end, "Debug float window")

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
    ["http"] = function()
        cmd.Rest({ "run", mods = { horizontal = true } })
    end,
    ["html"] = function()
        vim.system({ "firefox", fn.expand("%") })
    end,
    ["java"] = function()
        cmd.TermExec("cmd='javac %:p && java %:t:r'")
    end,
    ["javascript"] = function()
        cmd.TermExec("cmd='node %:p'")
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
        cmd.update()
        exec_program[vim.bo.filetype]()
    else
        vim.notify(string.format("File type [%s] is not in execute list!", vim.bo.filetype), vim.log.levels.ERROR)
    end
end, "Run code")

vim.t.is_transparent = false
local function toggle_transparent()
    if not vim.t.is_transparent then
        api.nvim_set_hl(0, "Normal", { bg = nil })
        vim.t.is_transparent = true
    else
        cmd.colorscheme(vim.g.colors_name)
        vim.t.is_transparent = false
    end
end
map("n", "<F2>", toggle_transparent, "Toggle transparent")
