local fn = vim.fn

local lazy_path = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazy_path) then
    fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazy_path,
    })
end
vim.opt.rtp:prepend(lazy_path)

require("lazy").setup({
    -- libraries
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-neotest/nvim-nio",
    -- fugitive
    "tpope/vim-fugitive",
    -- dressing
    {
        "stevearc/dressing.nvim",
        config = function()
            require("plugins.dressing")
        end,
    },
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-context",
                config = function()
                    require("plugins.treesitter-context")
                end,
            },
        },
        config = function()
            require("plugins.treesitter")
        end,
    },
    -- gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("plugins.gruvbox")
            vim.cmd.colorscheme("gruvbox")
        end,
    },
    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.lualine")
        end,
    },
    -- bufferline
    {
        "akinsho/nvim-bufferline.lua",
        config = function()
            require("plugins.bufferline")
        end,
    },
    -- comment
    {
        "numToStr/Comment.nvim",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        config = function()
            require("plugins.comment")
        end,
    },
    -- indent
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.indent")
        end,
    },
    -- nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeOpen", "NvimTreeToggle" },
        config = function()
            require("plugins.nvim-tree")
        end,
    },
    -- undotree
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        config = function()
            require("plugins.undotree")
        end,
    },
    -- terminal
    {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm", "TermExec" },
        config = function()
            require("plugins.term")
        end,
    },
    -- spectre
    {
        "nvim-pack/nvim-spectre",
        lazy = true,
        config = function()
            require("plugins.spectre")
        end,
    },
    -- zen-mode
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            require("plugins.zen")
        end,
    },
    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-file-browser.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function()
            require("plugins.telescope")
        end,
    },
    -- autopair
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins.autopair")
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    -- lsp
    {
        "mason-org/mason.nvim",
        dependencies = {
            { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        },
        config = function()
            require("plugins.mason")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lspconfig")
        end,
    },
    { "mfussenegger/nvim-jdtls", lazy = true },
    { "scalameta/nvim-metals", lazy = true },
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        config = function()
            require("plugins.lsp-signature")
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            require("plugins.null-ls")
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        config = function()
            require("plugins.trouble")
        end,
    },
    -- todo
    {
        "folke/todo-comments.nvim",
        config = function()
            require("plugins.todo")
        end,
    },
    -- annotation
    {
        "danymat/neogen",
        cmd = "Neogen",
        config = function()
            require("plugins.neogen")
        end,
    },
    -- snippet
    {
        "L3MON4D3/LuaSnip",
        event = { "InsertEnter", "BufRead *.snippets", "BufNewFile *.snippets" },
        config = function()
            require("plugins.luasnip")
        end,
    },
    -- completion
    {
        "hrsh7th/nvim-cmp",
        event = { "InsertEnter", "CmdlineEnter" },
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("plugins.cmp")
        end,
    },
    -- aerial
    {
        "stevearc/aerial.nvim",
        cmd = "AerialToggle",
        config = function()
            require("plugins.aerial")
        end,
    },
    -- dap
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        dependencies = {
            "rcarriga/nvim-dap-ui",
            {
                "theHamsta/nvim-dap-virtual-text",
                config = function()
                    require("nvim-dap-virtual-text").setup()
                end,
            },
        },
        config = function()
            require("plugins.dap")
        end,
    },
    -- latex
    {
        "lervag/vimtex",
        ft = "tex",
        config = function()
            require("plugins.vimtex")
        end,
    },
    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            fn["mkdp#util#install"]()
        end,
        ft = "markdown",
        config = function()
            require("plugins.markdown")
        end,
    },
    -- rest
    {
        "rest-nvim/rest.nvim",
        ft = "http",
    },
}, {
    lockfile = fn.stdpath("state") .. "/lazy-lock.json",
    ui = {
        border = "rounded",
        size = { width = 0.85, height = 0.7 },
    },
})
