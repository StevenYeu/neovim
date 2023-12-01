require('lazy').setup({
    { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            { 'j-hui/fidget.nvim', opts = {} },

            'folke/neodev.nvim',
        },
    },

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'rafamadriz/friendly-snippets',
        },
    },
    { 'folke/which-key.nvim',      opts = {} },

    {
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    { 'numToStr/Comment.nvim',  opts = {} },

    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview git hunk' })
                vim.keymap.set('n', '<leader>tb', require('gitsigns').toggle_current_line_blame,
                    { buffer = bufnr, desc = 'Toggle current line blame' })
                vim.keymap.set('n', '<leader>hs', require('gitsigns').stage_hunk,
                    { buffer = bufnr, desc = 'Stage hunk' })
                vim.keymap.set('n', '<leader>hr', require('gitsigns').reset_hunk,
                    { buffer = bufnr, desc = 'Reset hunk' })
                vim.keymap.set('n', '<leader>hS', require('gitsigns').stage_buffer,
                    { buffer = bufnr, desc = 'Stage buffer' })
                vim.keymap.set('n', '<leader>hu', require('gitsigns').undo_stage_hunk,
                    { buffer = bufnr, desc = 'Undo stage hunk' })
                vim.keymap.set('n', '<leader>hR', require('gitsigns').reset_buffer,
                    { buffer = bufnr, desc = 'Reset buffer' })
                vim.keymap.set('n', '<leader>hd', require('gitsigns').diffthis,
                    { buffer = bufnr, desc = 'Git Diff' })
                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, ']c', function()
                    if vim.wo.diff then
                        return ']c'
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
                vim.keymap.set({ 'n', 'v' }, '[c', function()
                    if vim.wo.diff then
                        return '[c'
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
            end,
        },
    },
    { import = 'custom.plugins' },
}, {})
