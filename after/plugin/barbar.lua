local wk = require("which-key")

vim.keymap.set("n", "<tab>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<leader>w", "<Cmd>BufferClose<CR>")
vim.keymap.set("n", "<S-tab>", "<Cmd>BufferPrevious<CR>")

wk.register({
	["<leader>w"] = { "Close Buffer Window" },
	["<tab>"] = { "Next Buffer Window" },
	["<S-tab>"] = { "Previous Buffer Window" },
})
