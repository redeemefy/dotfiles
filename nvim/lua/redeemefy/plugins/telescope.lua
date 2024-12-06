return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function()
            local k = vim.keymap
            local t = require("telescope")
            local tb = require("telescope.builtin")

            t.load_extension("fzf")
            t.setup({
                defaults = {
                    path_display = { "truncate" }
                }
            })

            k.set("n", "<leader>ff", tb.find_files, { desc = "Fuzzy find file in cwd" })
            k.set("n", "<leader>fo", tb.oldfiles, { desc = "Fuzzy find recent files" })
            k.set("n", "<leader>fs", tb.live_grep, { desc = "Fuzzy find string in cwd" })
            k.set("n", "<leader>fw", tb.grep_string, { desc = "Fuzzy find string under cursor in cwd" })
            k.set("n", "<leader>fb", tb.buffers, { desc = "Find buffers" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
