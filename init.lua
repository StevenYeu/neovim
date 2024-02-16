vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- [[ Install `lazy.nvim` plugin manager ]]
require("lazy-bootstrap")

-- [[ Configure plugins ]]
require("lazy-plugins")

-- [[ Setting options ]]
require("options")

-- [[ Basic Keymaps ]]
require("keymaps")

-- [[ Configure Telescope ]]
-- (fuzzy finder)
require("telescope-setup")

-- [[ Configure Treesitter ]]
-- (syntax parser for highlighting)
require("treesitter-setup")

-- [[ Configure LSP ]]
-- (Language Server Protocol)
require("lsp-setup")

require("cmp-setup")
