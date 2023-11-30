local wk = require("which-key")

vim.keymap.set("n", "<tab>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<leader>w", "<Cmd>BufferClose<CR>")
vim.keymap.set("n", "<S-tab>", "<Cmd>BufferPrevious<CR>")

wk.register({
	["<leader>w"] = { "Close Buffer Window" },
	["<tab>"] = { "Next Buffer Window" },
	["<S-tab>"] = { "Previous Buffer Window" },
})
return {'romgrk/barbar.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  }
