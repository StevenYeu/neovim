local wk = require("which-key")
vim.keymap.set("n", "<leader>b", ":NvimTreeToggle<cr>")
wk.register({
	["<leader>b"] = { "Toogle Nvim Tree" },
})
