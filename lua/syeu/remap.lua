vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- moVe highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Appends line below to end of current line while keeping cursor at beginning
vim.keymap.set("n", "J", "mzJ`z")

-- Page up and down nav. Place cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- While searching keeps search term in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste and delete to void register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete and flush buffer to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Copy buffer into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "Q", "<nop>")

-- Reaplce highlighted word with new word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Navigate betwen windows
vim.keymap.set("n", "<C-;>", "<C-w>h")
vim.keymap.set("n", "<C-[>", "<C-w>k")
vim.keymap.set("n", "<C-'>", "<C-w>l")
vim.keymap.set("n", "<C-/>", "<C-w>j")

-- Quick Fix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
