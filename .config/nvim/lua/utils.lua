local opt = vim.opt

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
vim.cmd.colorscheme("gruvbox")
vim.g.loaded_matchparen = 1

-- file
opt.undofile = true
opt.swapfile = false

-- other
opt.mouse = "a"
opt.hidden = true
opt.updatetime = 50
opt.showmode = false
opt.shortmess:append("c")
opt.splitkeep = "topline"
opt.scrolloff = math.floor(vim.o.lines * 0.25)
