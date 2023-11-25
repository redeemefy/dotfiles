local k = vim.keymap

require('gitsigns').setup()

k.set('n', ']h', ':Gitsigns next_hunk<CR>')
k.set('n', '[h', ':Gitsigns prev_hunk<CR>')
k.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
k.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
k.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
k.set('n', 'gb', ':Gitsigns blame_line<CR>')
