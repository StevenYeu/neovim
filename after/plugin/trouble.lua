-- Lua
local wk = require("which-key")

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

wk.register({
	x = {
		name = "Trouble Diagnostics",
		x = "Toggle Window",
		w = "Toggle Workspace",
		d = "Toggle Document",
		l = "Toggle Local List",
		q = "Toggle Quick Fix List",
	},
}, { prefix = "<leader>" })

wk.register({ ["gR"] = { "Toogle LSP Reference" } })
