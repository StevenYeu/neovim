local builtin = require("telescope.builtin")
local wk = require("which-key")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fw", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>fh", function()
    builtin.find_files({ find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" } })
end)

wk.register({
    f = {
        name = "Fuzzy Finder",
        f = { "Find Files" },
        g = "Search Git Files",
        w = "Grep Search",
        l = "Live Grep Search",
        h = "Search Hidden Files"
    },
}, { prefix = "<leader>" })
