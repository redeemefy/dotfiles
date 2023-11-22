--[[
	These keymappings are not specific to any plugin
--]]
-- <Space> for my leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local k = vim.keymap

-- Easier way to go normal mode
k.set('i', 'jj', '<ESC>')

-- Easier way to write/save a file
k.set('n', '<Leader>s', ':w<CR>')

-- Move next/previous line in wrapped text
k.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
k.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Better for indenting code manually
k.set('v', '<', '<gv')
k.set('v', '>', '>gv')

-- When replacing discard deleted item
k.set('v', 'p', '"_dP')
k.set('v', 'y', 'myy`y')

-- Insert ;/, at the end of the line
k.set('i', ';;', '<ESC>A;')
k.set('i', ',,', '<ESC>A,')

-- Disabled search highlight
k.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Move lines up/down
k.set('i', '<C-j>', '<ESC>:move +1<CR>==gi')
k.set('i', '<C-k>', '<ESC>:move -2<CR>==gi')
k.set('n', '<C-j>', ':move +1<CR>==')
k.set('n', '<C-k>', ':move -2<CR>==')
k.set('v', '<C-j>', ":move '>+1<CR>gv==gv")
k.set('v', '<C-k>', ":move <-2<CR>gv=gv")

