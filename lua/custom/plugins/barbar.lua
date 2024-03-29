local wk = require("which-key")
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<tab>", "<Cmd>BufferNext<CR>", opts)
vim.keymap.set("n", "<leader>cb", "<Cmd>BufferClose<CR>", opts)
vim.keymap.set("n", "<S-tab>", "<Cmd>BufferPrevious<CR>", opts)

wk.register({
    ["<leader>w"] = { "Close Buffer Window" },
    ["<tab>"] = { "Next Buffer Window" },
    ["<S-tab>"] = { "Previous Buffer Window" },
})
return {
    "romgrk/barbar.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {},
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
