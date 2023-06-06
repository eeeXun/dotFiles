local fn = vim.fn
local home = os.getenv("HOME")
local mason_jdtls = home .. "/.local/share/nvim/mason/share/jdtls/"
local root_dir = require("jdtls.setup").find_root({ ".git", "gradlew", "mvnw" })
local workspace_folder = home .. "/.cache/jdtls/" .. fn.fnamemodify(root_dir, ":p:h:t")

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
        fn.glob(mason_jdtls .. "plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration",
        mason_jdtls .. "config",
        "-data",
        workspace_folder,
    },
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
