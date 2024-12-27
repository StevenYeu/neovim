return {
    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        opts = {
            keymaps = {
                ["<C-h>"] = false
            },
            view_options = {
                show_hidden = false
            }
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            {
                "-",
                "<CMD>Oil<CR>",
                mode = "n",
                desc = "Oil - Open Parent Directory"
            }
        }
    }
}
