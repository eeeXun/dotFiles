local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd.packadd("packer.nvim")
end

require("packer").startup({
    function()
        -- packer
        use({ "wbthomason/packer.nvim" })
        -- icons/utils
        use({ "nvim-lua/plenary.nvim" })
        use({ "nvim-tree/nvim-web-devicons" })
        -- fugitive
        use({ "tpope/vim-fugitive" })
        -- gruvbox
        use({
            "ellisonleao/gruvbox.nvim",
            event = "ColorSchemePre",
            config = function()
                require("plugins.gruvbox")
            end,
        })
        -- undotree
        use({
            "mbbill/undotree",
            cmd = "UndotreeToggle",
            config = function()
                require("plugins.undotree")
            end,
        })
        -- terminal
        use({
            "akinsho/toggleterm.nvim",
            cmd = { "ToggleTerm", "TermExec" },
            config = function()
                require("plugins.term")
            end,
        })
        -- treesitter
        use({
            "nvim-treesitter/nvim-treesitter",
            run = function()
                require("nvim-treesitter.install").update({ with_sync = true })
            end,
            config = function()
                require("plugins.treesitter")
            end,
        })
        use({
            "nvim-treesitter/nvim-treesitter-context",
            after = "nvim-treesitter",
            config = function()
                require("plugins.treesitter-context")
            end,
        })
        -- comment
        use({
            "numToStr/Comment.nvim",
            event = "CursorHold",
            config = function()
                require("plugins.comment")
            end,
        })
        use({ "JoosepAlviste/nvim-ts-context-commentstring", opt = true })
        -- bufferline
        use({
            "akinsho/nvim-bufferline.lua",
            event = "ColorScheme",
            config = function()
                require("plugins.bufferline")
            end,
        })
        -- lualine
        use({
            "nvim-lualine/lualine.nvim",
            event = "ColorScheme",
            config = function()
                require("plugins.lualine")
            end,
        })
        -- nvim-tree
        use({
            "nvim-tree/nvim-tree.lua",
            cmd = { "NvimTreeOpen", "NvimTreeToggle" },
            config = function()
                require("plugins.nvim-tree")
            end,
        })
        -- telescope
        use({
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            requires = {
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    run = "make",
                    after = "telescope.nvim",
                    config = function()
                        require("telescope").load_extension("fzf")
                    end,
                },
                {
                    "nvim-telescope/telescope-file-browser.nvim",
                    after = "telescope.nvim",
                    config = function()
                        require("telescope").load_extension("file_browser")
                    end,
                },
            },
            config = function()
                require("plugins.telescope")
            end,
        })
        -- autopair
        use({
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = function()
                require("plugins.autopair")
            end,
        })
        use({
            "windwp/nvim-ts-autotag",
            event = "InsertEnter",
            config = function()
                require("nvim-ts-autotag").setup()
            end,
        })
        -- spectre
        use({
            "nvim-pack/nvim-spectre",
            event = "CursorHold",
            config = function()
                require("plugins.spectre")
            end,
        })
        -- lsp
        use({
            "williamboman/mason.nvim",
            requires = {
                { "WhoIsSethDaniel/mason-tool-installer.nvim" },
            },
            config = function()
                require("plugins.mason")
            end,
        })
        use({
            "neovim/nvim-lspconfig",
            after = "mason.nvim",
            config = function()
                require("plugins.lspconfig")
            end,
        })
        use({ "mfussenegger/nvim-jdtls", ft = "java" })
        use({
            "ray-x/lsp_signature.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("plugins.lsp-signature")
            end,
        })
        use({
            "jose-elias-alvarez/null-ls.nvim",
            after = "mason.nvim",
            config = function()
                require("plugins.null-ls")
            end,
        })
        use({
            "folke/trouble.nvim",
            cmd = "TroubleToggle",
            config = function()
                require("plugins.trouble")
            end,
        })
        -- snippet
        use({
            "L3MON4D3/LuaSnip",
            event = { "InsertEnter", "BufEnter *.snippets" },
            config = function()
                require("plugins.luasnip")
            end,
        })
        -- completion
        use({
            "hrsh7th/nvim-cmp",
            event = { "InsertEnter", "CmdlineEnter" },
            requires = {
                { "hrsh7th/cmp-nvim-lsp" },
                { "onsails/lspkind-nvim" },
                { "hrsh7th/cmp-path", after = "nvim-cmp" },
                { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
                { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
                { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
                { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
            },
            config = function()
                require("plugins.cmp")
            end,
        })
        -- aerial
        use({
            "stevearc/aerial.nvim",
            cmd = "AerialToggle",
            config = function()
                require("plugins.aerial")
            end,
        })
        -- dap
        use({
            "mfussenegger/nvim-dap",
            after = "mason.nvim",
            requires = {
                {
                    "rcarriga/nvim-dap-ui",
                    opt = true,
                },
                {
                    "theHamsta/nvim-dap-virtual-text",
                    after = "nvim-dap",
                    config = function()
                        require("nvim-dap-virtual-text").setup()
                    end,
                },
            },
            config = function()
                require("plugins.dap")
            end,
        })
        -- latex
        use({
            "lervag/vimtex",
            ft = "tex",
            config = function()
                require("plugins.vimtex")
            end,
        })
        -- markdown
        use({
            "iamcco/markdown-preview.nvim",
            run = function()
                fn["mkdp#util#install"]()
            end,
            ft = "markdown",
            config = function()
                require("plugins.markdown")
            end,
        })

        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        compile_path = fn.stdpath("data") .. "/plugin/packer_compiled.lua",
        display = {
            open_cmd = "vnew \\[packer\\]",
        },
    },
})

vim.cmd.luafile(fn.stdpath("data") .. "/plugin/packer_compiled.lua")
