local nvchad = require("nvchad.configs.lspconfig")
nvchad.defaults()

local lspconfig = require("lspconfig")

local servers = { "html", "cssls", "ruby_lsp" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvchad.on_attach,
        on_init = nvchad.on_init,
        capabilities = nvchad.capabilities,
    }
end
