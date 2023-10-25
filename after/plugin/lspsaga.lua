local wk = require("which-key")
local keymap = vim.keymap.set

keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })

keymap("n", "vrf", "<cmd>Lspsaga rename<CR>", { desc = "Rename symbol in file" })
keymap("n", "vrp", "<cmd>Lspsaga rename ++project<CR>", { desc = "Rename symbol in project" })

-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Goto Definition" })
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>", { desc = "Goto Type Definition" })
keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { desc = "Find Sysbol Definition" })

keymap(
    "n",
    "<leader>sl",
    "<cmd>Lspsaga show_line_diagnostics<CR>",
    { desc = "Show Line Diagnostic" }
)

keymap(
    "n",
    "<leader>sb",
    "<cmd>Lspsaga show_buf_diagnostics<CR>",
    { desc = "Show Buffer Diagnostic" }
)

keymap(
    "n",
    "<leader>sw",
    "<cmd>Lspsaga show_workspace_diagnostics<CR>",
    { desc = "Show Workspace Diagnostic" }
)

keymap(
    "n",
    "<leader>sc",
    "<cmd>Lspsaga show_cursor_diagnostics<CR>",
    { desc = "Show Cursor Diagnostic" }
)

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Jump Prev Diagnostic" })
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Jump Next Diagnostic" })
keymap("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({
        severity = vim.diagnostic.severity.ERROR,
    })
end, { desc = "Jump Prev Error Diagnostic" })
keymap("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next({
        severity = vim.diagnostic.severity.ERROR,
    })
end, { desc = "Jump Next Error Diagnostic" })

keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Toogle Outline" })

-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover" })

keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Show incoming calls" })
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Show outgoing calls" })
