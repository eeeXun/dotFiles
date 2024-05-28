local opt = vim.opt
local cmd = vim.cmd

-- number
opt.number = true
opt.relativenumber = true

-- indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- search
opt.hlsearch = false
opt.smartcase = true

-- style
opt.wrap = false
opt.guicursor = ""
opt.termguicolors = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.colorcolumn = "80"
cmd.colorscheme("gruvbox")
cmd.NoMatchParen()

-- file
opt.undofile = true
opt.swapfile = false

-- other
opt.mouse = "a"
opt.title = true
opt.hidden = true
opt.updatetime = 50
opt.showmode = false
opt.shortmess:append("c")
opt.splitkeep = "topline"
opt.scrolloff = math.floor(vim.o.lines * 0.25)

-- clipboard
vim.g.clipboard = {
    name = "OSC 52",
    copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
        ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
        ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    },
}
