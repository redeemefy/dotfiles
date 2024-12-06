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
                ensure_installed = { "lua_ls", "ruff_lsp", "html", "cssls", "tailwindcss", "emmet_language_server", "phpactor", "intelephense" },
                automatic_installation = true,
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lsp = require("lspconfig")

            lsp.lua_ls.setup({})
            lsp.ruff.setup({})
            lsp.intelephense.setup({})
            lsp.phpactor.setup({})

            vim.keymap.set("n", "<leader>ca", function()
                vim.lsp.buf.code_action()
            end, { desc = "Show code action" })

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
        end
    },
}
