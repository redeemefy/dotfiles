return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    config = function()
        require("neo-tree").setup({
            window = { width = 45 },
            filesystem = {
                filtered_items = { visible = true, hide_dotfiles = false, hide_gitignored = false },
            },
        })
    end,
    vim.keymap.set("n", "<leader>e", function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
    end, { desc = "Toggle NeoTree" }),
}

