local nvchad = require("nvchad.configs.lspconfig")
nvchad.defaults()

local servers = { "html", "cssls", "ruby_lsp" }

for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        on_attach = nvchad.on_attach,
        on_init = nvchad.on_init,
        capabilities = nvchad.capabilities,
    })
end

vim.lsp.enable(servers)
