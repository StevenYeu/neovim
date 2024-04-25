return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>fc",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = function(bufnr)
                if require("conform").get_formatter_info("ruff_format", bufnr).available then
                    return { "ruff_format" }
                else
                    return { "black" }
                end
            end,
            javascript = { { "prettierd", "prettier" } },
            typescript = { "prettierd" },
            svelte = { "prettierd" },
            css = { { "prettierd", "prettier" } },
            json = { { "prettier", "prettierd" } },
            html = { { "prettier", "prettierd" } },
            markdown = { { "prettier", "prettierd" } },
            javascriptreact = { { "prettier", "prettierd" } },
            typescriptreact = { "prettierd" },
            templ = { "templ" },
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
