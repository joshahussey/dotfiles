return {
    "nvim-telescope/telescope-media-files.nvim",
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                media_files = {
                    filetypes = { "png", "webp", "mp4", "jpg", "jpeg" },
                    find_cmd = "rg",
                },
            },
        })
        telescope.load_extension("media_files")
    end
}
