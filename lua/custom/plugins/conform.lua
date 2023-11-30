return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            "<leader>fc",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    -- Everything in opts will be passed to setup()
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black" },
            javascript = { { "prettierd", "prettier" } },
            typescript = { "prettierd" },
            svelte = { "prettierd" },
            css = { { "prettierd", "prettier" } },
            json = { { "prettier", "prettierd" } },
            html = { { "prettier", "prettierd" } },
            markdown = { { "prettier", "prettierd" } },
            javascriptreact = { { "prettier", "prettierd" } },
            typescriptreact = { "prettierd" },
        },
        formatters = {
            shfmt = {
                prepend_args = { "-i", "2" },
            },
        },
    },
    init = function()
        -- If you want the formatexpr, here is the place to set it
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
