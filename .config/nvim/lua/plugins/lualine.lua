local fn = vim.fn

local function location()
    return "%p%%  %l/%L  %v"
end

local function space()
    local space = fn.search([[\s\+$]], "nwc")
    return space ~= 0 and "TW:" .. space or ""
end

local function mixed()
    local space_pat = [[\v^ +]]
    local tab_pat = [[\v^\t+]]
    local space_indent = fn.search(space_pat, "nwc")
    local tab_indent = fn.search(tab_pat, "nwc")
    local mixed = (space_indent > 0 and tab_indent > 0)
    local mixed_same_line
    if not mixed then
        mixed_same_line = fn.search([[\v^(\t+ | +\t)]], "nwc")
        mixed = mixed_same_line > 0
    end
    if not mixed then
        return ""
    end
    if mixed_same_line ~= nil and mixed_same_line > 0 then
        return "MI:" .. mixed_same_line
    end
    local space_indent_cnt = fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
    local tab_indent_cnt = fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
    if space_indent_cnt > tab_indent_cnt then
        return "MI:" .. tab_indent
    else
        return "MI:" .. space_indent
    end
end

local function wordcount()
    return fn.wordcount().words .. " W"
end

local aerial = {
    filetypes = { "aerial" },
    sections = {
        lualine_a = { "filetype" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { location },
    },
}

local text = {
    filetypes = { "text" },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = { "branch", "diff" },
        lualine_x = { wordcount },
        lualine_y = { "filetype" },
        lualine_z = { location, space, mixed },
    },
}

local function term_name()
    return "Term #" .. vim.b.toggle_number
end
local toggleterm = {
    filetypes = { "toggleterm" },
    sections = {
        lualine_a = { term_name },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { location },
    },
}

require("lualine").setup({
    options = {
        globalstatus = true,
        section_separators = "",
        component_separators = "",
        disabled_filetypes = {
            winbar = { "aerial", "fugitive", "help", "NvimTree", "packer", "qf", "toggleterm", "Trouble", "undotree" },
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "filename" },
        lualine_c = { "branch", "diff" },
        lualine_x = {
            { "diagnostics", symbols = { error = " ", warn = " ", hint = "󰌵 ", info = " " } },
        },
        lualine_y = { "filetype" },
        lualine_z = { location, space, mixed },
    },
    winbar = {
        lualine_a = {},
        lualine_b = { "filetype" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "filename" },
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_a = { "filetype" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "filename" },
    },
    extensions = { aerial, text, toggleterm, "nvim-tree", "fugitive", "quickfix", "nvim-dap-ui" },
})
