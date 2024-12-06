local k = vim.keymap

k.set("i", "jj", "<ESC>", { desc = "Exit insert mode" })
k.set("n", "<leader>nh", "<CMD>nohl<CR>", { desc = "Exit insert mode" })

k.set("n", "<C-h>", "<C-w><C-h>", { desc = "Focus cursor to the left" })
k.set("n", "<C-l>", "<C-w><C-l>", { desc = "Focus cursor to the right" })
k.set("n", "<leader>s", ":w<CR>", { desc = "Save current file" })

