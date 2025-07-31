if os.getenv("SSH_TTY") ~= nil or (os.getenv("DISPLAY") == nil and os.getenv("WAYLAND_DISPLAY") == nil) then
    return
end

local system = vim.fn.system
local fcitx_cmd = "fcitx5-remote"
local autocmd = vim.api.nvim_create_autocmd

local function fcitx2en()
    if tonumber(system(fcitx_cmd)) == 2 then
        vim.b.input_toggle = true
        system({ fcitx_cmd, "-c" })
    end
end

local function fcitx2orig()
    if vim.b.input_toggle then
        system({ fcitx_cmd, "-o" })
        vim.b.input_toggle = false
    end
end

autocmd("InsertEnter", {
    callback = fcitx2orig,
})
autocmd("InsertLeave", {
    callback = fcitx2en,
})
autocmd("CmdlineEnter", {
    pattern = { "/", "\\?" },
    callback = fcitx2orig,
})
autocmd("CmdlineLeave", {
    pattern = { "/", "\\?" },
    callback = fcitx2en,
})
