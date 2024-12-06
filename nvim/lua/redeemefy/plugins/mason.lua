return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({})
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ruff_lsp" },
                automatic_installation = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lsp = require("lspconfig")

            lsp.lua_ls.setup({})
            lsp.ruff.setup({})

            vim.keymap.set("n", "<leader>ca", function()
                vim.lsp.buf.code_action()
            end, { desc = "Show code action" })
        end
    },
}
