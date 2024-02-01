return {
    "ellisonleao/glow.nvim",
    config = function()
        require("glow").setup({
            border = "none",
            width = 1000,
            height = 1000,
            width_ratio = 1,
            height_ratio = 1,
        })
    end,
}
