require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

-- NodeJS Video specific for NodeJS development
-- https://www.youtube.com/watch?v=CVCBHHFXWNE

-- Lua
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      telemetry = { enable = false },
      diagnostics = {
        globals = { 'vim' }
      },
    },
  }
})

-- PHP
require('lspconfig').intelephense.setup({})

-- JS family
require('lspconfig').volar.setup({
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'json'
  }
})

-- Tailwind CSS
require('lspconfig').tailwindcss.setup({})

-- Keymaps
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
