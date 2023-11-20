
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File Viewer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Highlighted Line Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Highlighted Line Up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Appends line below to end of current line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page Down Nav" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page Up Nav" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Keeps search term in middle" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Keeps search term in middle" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste and flush buffer" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy in system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy in system clipboard" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set(
	"n",
	"<leader>rs",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace highlighted word" }
)

-- Quick Fix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Switch Tmux session" })
vim.keymap.set("n", "<leader>q", "^", { desc = "Go to start of line" })
vim.keymap.set("n", "<leader>e", "$", { desc = "Go to end of line" })

