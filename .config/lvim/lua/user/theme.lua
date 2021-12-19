-- local M = {}

-- function M.setup()
--   lvim.colorscheme = "material"
--   vim.g.material_style = "palenight"
--   lvim.builtin.lualine.options.theme = "material-nvim"

--   require("material").setup {
--     italics = {
--       comments = true,
--       keywords = true,
--       functions = true
--     }
--   }
-- end

-- return M

require("material").setup({
  italics = {
    comments = true,
    keywords = true,
    functions = true
  }
})
lvim.colorscheme = "material"
vim.g.material_style = "palenight"
lvim.builtin.lualine.options.theme = "material-nvim"
