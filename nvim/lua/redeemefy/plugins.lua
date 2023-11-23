local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init({
  compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'solid' })
    end,
  },
})

local use = require('packer').use

-- Colorscheme
use({
  "catppuccin/nvim", as = "catppuccin",
  config = function()
    require('catppuccin').setup({
      flavour = 'frappe', -- latte, frappe, macchiato, mocha
      styles = {
        loops = {},
        functions = {},
        keywords = { 'italic' },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      }
    })
    vim.cmd('colorscheme catppuccin')
    vim.api.nvim_set_hl(0, 'FloatBorder', {
      fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
      bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
    })
  end
})

-- packer manages itself
use('wbthomason/packer.nvim')
-- easier comments
-- use('tpope/vim-commentary')

-- Add, change, and delete sorrounding text.
use('tpope/vim-surround')

-- Indent automatically with editorconfig support
use('tpope/vim-sleuth')

-- Automatically add closing ', ", ), }, ]
use({
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup()
  end
})

-- Smooth page scrolling to keep context on big jumps
use({
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup()
  end
})

-- Close the buffer without closing the split
use({
  'famiu/bufdelete.nvim',
  config = function() vim.keymap.set('n', '<Leader>bd', ':Bdelete<CR>')
  end
})

if packer_bootstrap then
  require('packer').sync()
end

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile>
augroup end
]])
