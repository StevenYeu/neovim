local builtin = require("telescope.builtin")
local wk = require("which-key")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fw", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

wk.register({
	f = {
		name = "Fuzzy Finder",
		f = { "Find Files" },
		g = "Search  File",
		w = "Grep Search",
	},
}, { prefix = "<leader>" })
