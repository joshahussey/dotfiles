require("glow").setup({
	border = "none",
	width = 1000,
	height = 1000,
	width_ratio = 1,
	height_ratio = 1,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
        vim.schedule(function()
            require('misc.remap').glow(0)
            vim.cmd("Glow")
        end)
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "glowpreview",
    callback = function()
        vim.schedule(function()
            require('misc.remap').glow(0)
        end)
    end,
})
