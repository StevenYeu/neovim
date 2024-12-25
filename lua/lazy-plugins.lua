require("lazy").setup({
    -- { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
    -- {
    --     "neovim/nvim-lspconfig",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "williamboman/mason-lspconfig.nvim",
    --         { "j-hui/fidget.nvim", opts = {} },
    --         {
    --             "folke/lazydev.nvim",
    --             ft = "lua", -- only load on lua files
    --             opts = {
    --                 library = {
    --                     -- See the configuration section for more details
    --                     -- Load luvit types when the `vim.uv` word is found
    --                     { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    --                 },
    --             },
    --         }
    --     },
    -- },
    --
    -- {
    --     "hrsh7th/nvim-cmp",
    --     dependencies = {
    --         "L3MON4D3/LuaSnip",
    --         "saadparwaiz1/cmp_luasnip",
    --         "hrsh7th/cmp-nvim-lsp",
    --         "hrsh7th/cmp-path",
    --         "rafamadriz/friendly-snippets",
    --     },
    -- },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "main",
                dark_variant = "main",
                styles = {
                    transparency = true
                }
            })
            vim.cmd("colorscheme rose-pine")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup({})
        end,
    },
    { "numToStr/Comment.nvim",     opts = {} },
    { import = "custom.plugins" },
}, {})
