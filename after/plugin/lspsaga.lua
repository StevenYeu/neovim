local wk = require("which-key")
local keymap = vim.keymap.set

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "vgr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
--keymap("n", "grp", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- Use <C-t> to jump back
--keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- Show buffer diagnostics
keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
keymap("n", "]E", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
--keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

keymap("n", "vrf", "<cmd>Lspsaga finder ref <CR>")

wk.register({
	["<leader>gh"] = { "Find Symbol Def" },
	["<leader>ca"] = { "Code Action" },
	["vgr"] = { "Rename All Occurances" },
	["gp"] = { "Peek Definition" },
	["gd"] = { "Go to Definition" },
	["gt"] = { "Go to Definition" },
	["<leader>sl"] = { "Show Line Diagnostic" },
	["<leader>sb"] = { "Show Buffer Diagnostic" },
	["<leader>sw"] = { "Show Worspace Diagnostic" },
	["<leader>sc"] = { "Show Cursor Diagnostic" },
	["[e"] = { "Jump Prev Diagnostic" },
	["]e"] = { "Jump Next Diagnostic" },
	["[E"] = { "Jump Prev Error Diagnostic" },
	["]E"] = { "Jump Next Error Diagnostic" },
	["<leader>o"] = { "Toogle Outline" },
	["K"] = { "Hover" },
	["<leader>cb"] = { "Show outgoing calls" },
	["<leader>ci"] = { "Show incoming calls" },
	["vrf"] = { "Show References, Implementations, Definitions" },
	["<leader>fc"] = { "Format Code" },
}, { mode = "n" })
