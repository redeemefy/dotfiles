local o = vim.opt

o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true
o.wrap = false
o.number = true
o.relativenumber = true
o.wildmode = 'longest:full,full'                -- complete the longest common match, and allow tabbing the result to fully complete them
o.mouse = 'a'                                   -- enable mouse for all modes
o.termguicolors = true
o.title = true
o.ignorecase = true
o.smartcase = true
o.list = true                                   -- enable the below listchars
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
