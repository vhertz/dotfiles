return {
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
          "williamboman/mason.nvim",
          "nvimtools/none-ls.nvim",
        },
        opts = {
            handlers = {}
        },
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            require("null-ls").setup()
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
}
