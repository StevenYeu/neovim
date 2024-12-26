return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },
    {
        "hrsh7th/nvim-cmp",
        event = 'InsertEnter',
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            'hrsh7th/cmp-buffer',
            "rafamadriz/friendly-snippets",
        },
        config = function()
            local cmp = require('cmp')

            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            require("luasnip").filetype_extend("typescriptreact", { "html" })
            require("luasnip").filetype_extend("templ", { "html" })
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                sources = {
                    { name = 'path' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', keyword_length = 2 },
                    { name = 'buffer',  keyword_length = 3 },
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    -- confirm completion item
                    ['<C-y>"'] = cmp.mapping.confirm({ select = true }),
                    -- navigate completion items
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    -- trigger completion menu
                    ['<C-c>'] = cmp.mapping.complete(),

                    -- scroll up and down the documentation window
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),

                    -- jump to the next snippet placeholder
                    ['<C-f>'] = cmp.mapping(function(fallback)
                        local luasnip = require('luasnip')
                        if luasnip.locally_jumpable(1) then
                            luasnip.jump(1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),

                    -- jump to the previous snippet placeholder
                    ['<C-b>'] = cmp.mapping(function(fallback)
                        local luasnip = require('luasnip')
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- { "j-hui/fidget.nvim",opts = {} },
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            }
        },
        init = function()
            vim.opt.signcolumn = 'yes'
        end,
        config = function()
            local lsp_defaults = require('lspconfig').util.default_config
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local nmap = function(keys, func, desc)
                        if desc then
                            desc = "LSP: " .. desc
                        end
                        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
                    end
                    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

                    nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
                    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                    nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
                    nmap("gl", vim.diagnostic.open_float, "[S]how [D]iagnostic")
                    nmap("gD", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
                    nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
                    nmap(
                        "<leader>ws",
                        require("telescope.builtin").lsp_dynamic_workspace_symbols,
                        "[W]orkspace [S]ymbols"
                    )
                    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
                    nmap("gs", vim.lsp.buf.signature_help, "Signature Documentation")
                end,
            })

            -- local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities.textDocument.completion.completionItem.snippetSupport = true
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "ts_ls",
                    "rust_analyzer",
                    "gopls",
                    "pyright",
                    "ruff",
                    "lua_ls",
                    "templ",
                    "tailwindcss",
                    "html",
                    "zls",
                    "htmx",
                },
                automatic_installation = false,
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                    pyright = function()
                        require("lspconfig").pyright.setup({
                            settings = {
                                pyright = {
                                    disableOrganizeImports = true,
                                },
                                python = {
                                    analysis = {
                                        typeCheckingMode = "strict",
                                    },
                                },
                            },
                        })
                    end,
                    ruff = function()
                        require("lspconfig").ruff.setup({
                            on_attach = function(client, _)
                                if client.name == "ruff" then
                                    client.server_capabilities.hoverProvider = false
                                end
                            end,
                        })
                    end,
                    -- tailwindcss = function()
                    --     require("lspconfig").tailwindcss.setup({
                    --         filetypes = {
                    --             "templ",
                    --             "typescriptreact",
                    --             "javascriptreact",
                    --             "javascript",
                    --             "typescript",
                    --             "react",
                    --         },
                    --         init_options = { userLanguages = { templ = "html" } },
                    --     })
                    -- end,
                    html = function()
                        require("lspconfig").html.setup({
                            filetypes = { "html", "templ" },
                        })
                    end,
                    htmx = function()
                        require("lspconfig").htmx.setup({
                            filetypes = { "html", "templ" },
                        })
                    end,
                    bashls = function()
                        require("lspconfig").bashls.setup({
                            filetypes = { "sh", "zsh" },
                        })
                    end


                },
            })
        end
    } }
