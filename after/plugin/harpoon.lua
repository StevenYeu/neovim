local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-h>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-t>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-n>", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<C-s>", function()
	ui.nav_file(4)
end)

wk.register({
	["<leader>a"] = { "Add File to Harpoon" },
	["<C-e>"] = { "Harpoon Menu" },
	["<C-h"] = { "Pinned Harpoon File 1" },
	["<C-t"] = { "Pineed Haproon File 2" },
	["<C-n"] = { "Pinned Harpoon File 3" },
	["<C-s"] = { "Pinned Harpoon File 4" },
})

wk.register({
	f = {
		name = "Harpoon Files",
		f = { "Find Files" },
		g = "Search  File",
		w = "Grep Search",
	},
}, { prefix = "<leader>" })
