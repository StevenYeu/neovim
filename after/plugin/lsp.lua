local lsp_zero = require("lsp-zero")

-- lsp_zero.on_attach(function(client, bufnr)
--     local opts = { buffer = bufnr, remap = false }
--     vim.keymap.set("n", "<space>fc", function()
--         if client.name == 'pyright' or client.name == "ruff_lsp" then
--             vim.cmd("silent !black -q %")
--         else
--             vim.lsp.buf.format({ async = true })
--         end
--     end, opts)
-- end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = { "tsserver", "rust_analyzer", "gopls", "pyright", "lua_ls" },
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require("lsp-zero").cmp_action()
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})
require("lspconfig").pyright.setup({
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "strict",
			},
		},
	},
})

require("lspconfig").ruff_lsp.setup({
	on_attach = function(client, buffer)
		client.server_capabilities.hoverProvider = false
	end,
})

vim.diagnostic.config({
	virtual_text = true,
})
