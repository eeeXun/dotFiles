local function setup_jdtls()
    local fn = vim.fn
    local mason_share = fn.expand("$MASON/share/")
    local mason_jdtls = mason_share .. "jdtls/"
    local root_dir = vim.fs.root(0, { ".git", "gradlew", "mvnw" })
    local workspace_folder = fn.stdpath("cache")
        .. "/jdtls/"
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
            "-javaagent:" .. mason_jdtls .. "lombok.jar",
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
        root_dir = root_dir,
        settings = {
            java = {
                autobuild = { enabled = false },
            },
        },
        init_options = {
            bundles = {
                mason_share .. "java-debug-adapter/com.microsoft.java.debug.plugin.jar",
                unpack(vim.split(fn.glob(mason_share .. "java-test/*.jar", 1), "\n")),
            },
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })
end

if not vim.g.java_opened then
    vim.ui.select({ "No", "Yes" }, { prompt = "Run Jdtls?" }, function(choice)
        if choice == "Yes" then
            vim.g.jdtls = true
            setup_jdtls()
        end
    end)
    vim.g.java_opened = true
end

if vim.g.jdtls then
    setup_jdtls()
end
