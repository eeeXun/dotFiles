local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.filetype_extend("cpp", { "c" })

require("luasnip.loaders.from_snipmate").lazy_load()

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
