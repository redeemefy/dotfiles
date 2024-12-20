local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local opt = vim.opt

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
opt.rtp:prepend(lazypath)

require("lazy").setup({
    import = "redeemefy.plugins",
    change_detection = {
        enabled = false,
    },
})

