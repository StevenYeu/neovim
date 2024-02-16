
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require("lsp-zero").cmp_action()
local lsp_zero = require("lsp-zero")
local luasnip = require("luasnip")
require('luasnip').filetype_extend("typescriptreact", { "html" })
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup {}

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
