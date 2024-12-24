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
vim.keymap.set("n", "U", "<C-r>")

vim.keymap.set(
    "n",
    "<leader>rs",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace highlighted word" }
)

vim.keymap.set(
    "n",
    "<leader>rl",
    [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace highlighted word for current line" }
)
-- Quick Fix
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR><C-w>pzz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR><C-w>pzz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>", { desc = "Switch Tmux session" })

vim.keymap.set("n", "<leader>b", ":NvimTreeToggle<cr>", { desc = "Toggle Nvim Tree" })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree Toggle" })

-- Trouble

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true, desc = "Toogle Trouble Window" })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true, desc = "Toggle Workspace" })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true, desc = "Toggle Document" })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true, desc = "Toggle Local List" })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true, desc = "Toggle Quick Fix List" })
vim.keymap.set("n", "<leader>xr", "<cmd>TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true, desc = "Toogle LSP Reference" })


-- Split Window Management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split Window Equally" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close Split Window" })
