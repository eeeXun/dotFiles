local fn = vim.fn
local mason_share = fn.stdpath("data") .. "/mason/share/"
local mason_jdtls = mason_share .. "jdtls/"
local root_dir = require("jdtls.setup").find_root({ ".git", "gradlew", "mvnw" })
local workspace_folder = os.getenv("HOME")
    .. "/.cache/jdtls/"
    .. string.gsub(fn.fnamemodify(root_dir, ":p:h"), "/", "%%")

vim.api.nvim_buf_create_user_command(0, "JdtTestClass", require("jdtls").test_class, {})

require("jdtls").start_or_attach({
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.level=ALL",
        "-Xmx1G",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        mason_jdtls .. "plugins/org.eclipse.equinox.launcher.jar",
        "-configuration",
        mason_jdtls .. "config",
        "-data",
        workspace_folder,
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    init_options = {
        bundles = {
            mason_share .. "java-debug-adapter/com.microsoft.java.debug.plugin.jar",
            unpack(vim.split(fn.glob(mason_share .. "java-test/*.jar", 1), "\n")),
        },
    },
})
