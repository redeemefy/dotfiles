require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'gitignore',
    'lua',
    'luadoc',
    'vim',
    'javascript',
    'typescript',
    'jsdoc',
    'json',
    'html',
    'css',
    'csv',
    'dockerfile',
    'bash',
    'php',
    'phpdoc',
    'regex',
    'rust',
    'sql',
    'tsv',
  },
  highlight = {
    enable = true,
    -- check spelling only on strings
    additional_vim_regex_highlighting = true,
  },
  -- future treesitter plugins [context_commentstring, textobjects]
  -- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Extra-modules-and-plugins
})
