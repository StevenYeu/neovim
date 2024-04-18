return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        vim.keymap.set("n", "<leader>e", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<C-b>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-n>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-m>", function() harpoon:list():select(3) end)
        -- vim.keymap.set("n", "<C-.>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        local navOptions = { ui_nav_wrap = true }
        vim.keymap.set("n", "<tab>", function() harpoon:list():prev(navOptions) end)
        vim.keymap.set("n", "<S-tab>", function() harpoon:list():next(navOptions) end)
    end
}
