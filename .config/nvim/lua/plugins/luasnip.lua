local ls = require("luasnip")
local types = require("luasnip.util.types")

require("luasnip.loaders.from_snipmate").lazy_load()

ls.filetype_extend("cpp", { "c" })

ls.config.setup({
    history = false,
    region_check_events = "InsertEnter",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "●", "GruvboxOrange" } },
            },
        },
        [types.insertNode] = {
            active = {
                virt_text = { { "●", "GruvboxBlue" } },
            },
        },
    },
})
