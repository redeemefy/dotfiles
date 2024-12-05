vim.g.mapleader = " "

local opt = vim.opt


-- UI Settings
opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.termguicolors = true

-- tab or spaces
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4

opt.clipboard = "unnamedplus"
opt.scrolloff = 999 -- attempt to keep cursorn in the middle of the screen

-- Window Management
opt.splitbelow = true
opt.splitright = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
