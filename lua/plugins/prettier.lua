return {
    "MunifTanjim/prettier.nvim",
    config = function()
        local prettier = require("prettier")

        prettier.setup({
            bin = 'prettierd',
            filetypes = require("pluginextension.prettier-filetypes").filetypes,
        })
    end
}
