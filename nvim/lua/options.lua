require "nvchad.options"

local o = vim.o

o.relativenumber = true

if vim.g.neovide then
    o.guifont = "Operator Mono:h18"
end
