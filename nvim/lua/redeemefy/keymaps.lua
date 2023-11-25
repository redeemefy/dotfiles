--[[
These keymappings are not specific to any plugin
--]]
-- <Space> for my leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local k = vim.keymap

-- Easier way to go normal mode
k.set('i', 'jj', '<ESC>')

-- Open nvim setting files
k.set('n', '<leader>ek', ':e ~/workspace/dotfiles/nvim/lua/redeemefy/keymaps.lua<CR>')
k.set('n', '<leader>ep', ':e ~/workspace/dotfiles/nvim/lua/redeemefy/plugins.lua<CR>')
k.set('n', '<leader>eo', ':e ~/workspace/dotfiles/nvim/lua/redeemefy/options.lua<CR>')

-- Easier way to write/save a file
k.set('n', '<Leader>s', ':w<CR>')

-- Move next/previous line in wrapped text
k.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
k.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Better for indenting code manually
k.set('v', '<', '<gv')
k.set('v', '>', '>gv')
k.set('n', '<Leader>ri', '<ESC>ffVG=')

-- Buffer management
k.set('n', '<Leader>bn', ':bn<CR>')
k.set('n', '<Leader>bp', ':bp<CR>')

-- Window navigation
k.set('n', '<C-h>', '<C-w>h')
k.set('n', '<C-l>', '<C-w>l')

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
k.set('v', '<C-k>', ":move '<-2<CR>gv=gv")

-- Terminal
k.set('n', '<Leader>to', ':ToggleTerm<CR>')

