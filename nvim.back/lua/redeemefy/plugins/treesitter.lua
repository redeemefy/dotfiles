return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },

                ensure_installed = { "lua", "vim", "python", "html", "css", "php", "phpdoc", "sql" },

                -- incremental_selection = { 
                --     enable = true, 
                --     keymaps = {
                --         init_selection = "<leader>gis",
                --         node_incremental = "<leader>gni",
                --         scope_incremental = "<leader>gsi",
                --         node_decremental = "<leader>gnd",
                --     },
                -- },
                -- textobjects = {
                --     select = { 
                --         enable = true,
                --         lookahead = true,
                --         keymaps = {
                --             ["<leader>of"] = { query = "@function.outer", desc = "Select outer part of function region" },
                --             ["<leader>if"] = { query = "@function.inner", desc = "Select inner part of function region" },
                --             ["<leader>oc"] = { query = "@class.outer", desc = "Select outer part of class region" },
                --             ["<leader>ic"] = { query = "@class.inner", desc = "Select inner part of class region" },
                --         },
                --         selection_modes = {
                --             ["@parameter.outer"] = "v",
                --             ["@function.outer"] = "V",
                --             ["@class.outer"] = "<C-v>",
                --         },
                --         include_surrounding_whitespace = true,
                --     },
                -- },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
}
