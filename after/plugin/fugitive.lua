local wk = require("which-key")

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

wk.register({
	["<leader>gs"] = { "Git Fugitive" },
})
