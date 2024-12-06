return {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
        local a = require("nvim-autopairs")
        a.setup({
            check_ts = true,
            ts_config = {
                lua = { "string" },
            },
        })
    end
}
