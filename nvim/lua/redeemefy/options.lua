local o = vim.opt

o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.smartindent = true
o.expandtab = true
o.wrap = false
o.number = true
o.relativenumber = true
o.wildmode = 'longest:full,full'                -- complete the longest common match, and allow tabbing the result to fully complete them
o.mouse = 'a'                                   -- enable mouse for all modes
o.termguicolors = true
-- o.spell = true
-- o.syntax = 'enable'
o.cursorline = true
o.signcolumn = 'yes:1'
o.ignorecase = true
o.smartcase = true
o.list = false                                  -- show tabs and spaces
o.listchars = { tab = "- ", trail = "." }       -- character to show for tabs and spaces
o.fillchars:append({ eob = ' ' })               -- remove ~ from end of the buffer
o.splitbelow = true
o.splitright = true
o.scrolloff = 8
o.sidescrolloff = 8
o.clipboard = 'unnamedplus'                     -- use system clipboard
o.confirm = true
o.undofile = true                               -- persist undo history
o.backup = true                                 -- automatically save a backup file
o.backupdir:remove('.')                         -- keep backup file out of currect directory
