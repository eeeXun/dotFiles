local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

require("telescope").setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        file_browser = {
            grouped = true,
            git_status = false,
        },
    },
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.85,
            height = 0.9,
            preview_width = 0.6,
            prompt_position = "top",
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-h>"] = action_layout.toggle_preview,
            },
            n = {
                ["<C-h>"] = action_layout.toggle_preview,
            },
        },
    },
})
