local wk = require("which-key")

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Quick Fix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

wk.register({
	["<leader>pv"] = { "File Viewer" },
	["J"] = { "Move Highlighted Line Down" },
	["K"] = { "Move Highligted Line Up" },
}, { mode = "v" })

wk.register({
	["J"] = { " Appends line below to end of current line" },
	["<C-d>"] = { "Page Down Nav" },
	["<C-u<"] = { "Page Up Nav" },
	["n"] = { "Keeps Serach Term in Middle" },
	["N"] = { "Keeps Search Term in Middle" },
	["<leader>rs"] = { "Replace Highligted Word with new word" },
	["<C-f>"] = { "Switch Tmux Session" },
}, { mode = "n" })

wk.register({
	["<leader>p"] = { "Paste and flush buffer" },
}, { mode = "x" })

wk.register({
	y = { "Copy in system clipboard" },
	d = { "Delete and flush buffer" },
}, { mode = { "n", "v" }, prefix = "<leader>" })

wk.register({
	y = { "Copy in system clipboard" },
}, { mode = { "n", "v" }, prefix = "<leader>" })
