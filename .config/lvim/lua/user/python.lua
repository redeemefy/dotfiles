-- lvim.lang.python.formatters = { { exe = "black" } }
-- lvim.lang.python.linters = { { exe = "flake8" } }

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", filetypes = { "python" } }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8", filetypes = { "python" } },
  -- { exe = "pylint-django", filetypes = { "python" } },
}
