local fn = vim.fn

local lazy_path = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
    fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
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
    -- gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        event = "ColorSchemePre",
        config = function()
            require("plugins.gruvbox")
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
    -- comment
    {
        "numToStr/Comment.nvim",
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        config = function()
            require("plugins.comment")
        end,
    },
    -- spectre
    {
        "nvim-pack/nvim-spectre",
        event = "ColorScheme",
        config = function()
            require("plugins.spectre")
        end,
    },
    -- bufferline
    {
        "akinsho/nvim-bufferline.lua",
        event = "ColorScheme",
        config = function()
            require("plugins.bufferline")
        end,
    },
    -- lualine
    {
        "nvim-lualine/lualine.nvim",
        event = "ColorScheme",
        config = function()
            require("plugins.lualine")
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
    -- rest
    {
        "rest-nvim/rest.nvim",
        tag = "v1.2.1",
        ft = "http",
        config = function()
            require("plugins.rest")
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
        "williamboman/mason.nvim",
        dependencies = {
            { "WhoIsSethDaniel/mason-tool-installer.nvim" },
        },
        config = function()
            require("plugins.mason")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "hrsh7th/cmp-nvim-lsp" },
        config = function()
            require("plugins.lspconfig")
        end,
    },
    { "mfussenegger/nvim-jdtls", lazy = true },
    { "scalameta/nvim-metals", lazy = true },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("plugins.lsp-signature")
        end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("plugins.null-ls")
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        config = function()
            require("plugins.trouble")
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
        event = "ColorScheme",
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
}, {
    lockfile = fn.stdpath("state") .. "/lazy-lock.json",
    ui = {
        border = "rounded",
        size = { width = 0.85, height = 0.7 },
    },
})
