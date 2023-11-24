local k = vim.keymap

vim.cmd([[
highlight link TelescopePromptTitle UfoFoldedEllipsis
highlight link TelescopePreviewTitle UfoFoldedEllipsis
highlight link TelescopePreviewNormal NormalFloat
highlight link TelescopePromptNormal NormalFloat
highlight link TelescopePromptBorder FloatBorder
highlight link TelescopeNormal CursorLine
]])
-- highlight link TelescopeBorder CursorLine

require('telescope').setup({
	defaults = {
		path_display = { truncate = 1 },
		prompt_prefix = '   ',
		selection_caret = ' ',
		layout_config = {
			prompt_position = 'top',
		},
		sorting_strategy = 'ascending',
		mappings = {},
		file_ignore_patterns = { '.git/' },
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')

k.set('n', '<Leader>tf', [[<CMD>lua require('telescope.builtin').find_files()<CR>]])
k.set('n', '<Leader>tb', [[<CMD>lua require('telescope.builtin').buffers({ prompt_title = 'Buffers' })<CR>]])
k.set('n', '<Leader>tg', [[<CMD>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
k.set('n', '<Leader>th', [[<CMD>lua require('telescope.builtin').oldfiles({ prompt_title = 'History' })<CR>]])
k.set('n', '<Leader>ts', [[<CMD>lua require('telescope.builtin').lsp_document_symbols({ prompt_title = 'Document Symbols' })<CR>]])
k.set('n', '<Leader>tS', [[<CMD>lua require('telescope.builtin').lsp_workspace_symbols({ prompt_title = 'Workspace Symbols' })<CR>]])
