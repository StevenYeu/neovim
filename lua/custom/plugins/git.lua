return {
    {
        "tpope/vim-fugitive"
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            on_attach = function(bufnr)
                vim.keymap.set(
                    "n",
                    "<leader>hp",
                    require("gitsigns").preview_hunk,
                    { buffer = bufnr, desc = "Preview git hunk" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>tb",
                    require("gitsigns").toggle_current_line_blame,
                    { buffer = bufnr, desc = "Toggle current line blame" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>hs",
                    require("gitsigns").stage_hunk,
                    { buffer = bufnr, desc = "Stage hunk" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>hr",
                    require("gitsigns").reset_hunk,
                    { buffer = bufnr, desc = "Reset hunk" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>hS",
                    require("gitsigns").stage_buffer,
                    { buffer = bufnr, desc = "Stage buffer" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>hu",
                    require("gitsigns").undo_stage_hunk,
                    { buffer = bufnr, desc = "Undo stage hunk" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>hR",
                    require("gitsigns").reset_buffer,
                    { buffer = bufnr, desc = "Reset buffer" }
                )
                vim.keymap.set(
                    "n",
                    "<leader>hd",
                    require("gitsigns").diffthis,
                    { buffer = bufnr, desc = "Git Diff" }
                )
                local gs = package.loaded.gitsigns
                vim.keymap.set({ "n", "v" }, "]c", function()
                    if vim.wo.diff then
                        return "]c"
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })
                vim.keymap.set({ "n", "v" }, "[c", function()
                    if vim.wo.diff then
                        return "[c"
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return "<Ignore>"
                end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })
            end,
        },
    }
}
