return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Search Git Files" })
        vim.keymap.set("n", "<leader>fl", function()
            builtin.live_grep({ file_ignore_patterns = { "vendor", "node_modules" } })
        end, { desc = "Live Search" })
        vim.keymap.set("n", "<leader>fw", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Grep Search" })
        vim.keymap.set("n", "<leader>ff", function()
            builtin.find_files({
                find_command = {
                    "rg",
                    "--files",
                    "--hidden",
                    "-g",
                    "!**/.git/*",
                    "-g",
                    "!**/vendor/**",
                    "-g",
                    "!**/node_modules/**",
                },
            })
        end, { desc = "Find File" })

        vim.keymap.set("n", "<leader>fd", function()
            builtin.find_files({ hidden = true, no_ignore = true })
        end, { desc = "Find File Hidden" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search Help" })
        vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Search JumpList" })
    end,
}
