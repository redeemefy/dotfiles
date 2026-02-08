require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "LSP document symbols" })
map("n", "<leader>ws", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "LSP workspace symbols" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
