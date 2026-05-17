local getenv = os.getenv

if getenv("SSH_TTY") or ((not getenv("DISPLAY")) and (not getenv("WAYLAND_DISPLAY"))) then
    return
end

local fn = vim.fn
local system = vim.system
local wsl_cmd = "im-select"
local linux_cmd = "fcitx5-remote"
local autocmd = vim.api.nvim_create_autocmd

local function wsl2en()
    if tonumber(system({ wsl_cmd }):wait().stdout) ~= 1033 then
        vim.b.input_toggle = true
        system({ wsl_cmd, 1033 })
    end
end

local function wsl2orig()
    if vim.b.input_toggle then
        system({ wsl_cmd, 0 })
        vim.b.input_toggle = false
    end
end

local function linux2en()
    if tonumber(system({ linux_cmd }):wait().stdout) == 2 then
        vim.b.input_toggle = true
        system({ linux_cmd, "-c" })
    end
end

local function linux2orig()
    if vim.b.input_toggle then
        system({ linux_cmd, "-o" })
        vim.b.input_toggle = false
    end
end

if fn.has("wsl") == 1 then
    if fn.executable(wsl_cmd) == 0 then
        local im_select_path = fn.expand("$HOME/.local/bin/im-select")
        system({
            "wget",
            "-O",
            im_select_path,
            "https://github.com/daipeihust/im-select/raw/master/win/out/x64/im-select.exe",
        }):wait()
        system({ "chmod", "+x", im_select_path }):wait()
    end
    autocmd("InsertEnter", {
        callback = wsl2orig,
    })
    autocmd("InsertLeave", {
        callback = wsl2en,
    })
    autocmd("CmdlineEnter", {
        pattern = { "/", "\\?" },
        callback = wsl2orig,
    })
    autocmd("CmdlineLeave", {
        pattern = { "/", "\\?" },
        callback = wsl2en,
    })
else
    autocmd("InsertEnter", {
        callback = linux2orig,
    })
    autocmd("InsertLeave", {
        callback = linux2en,
    })
    autocmd("CmdlineEnter", {
        pattern = { "/", "\\?" },
        callback = linux2orig,
    })
    autocmd("CmdlineLeave", {
        pattern = { "/", "\\?" },
        callback = linux2en,
    })
end
