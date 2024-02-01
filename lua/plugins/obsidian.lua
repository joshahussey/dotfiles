return {
    "epwalsh/obsidian.nvim",
    config = function()
        require("obsidian").setup({
            dir = "/home/josh/Documents/notes",
            notes_subdir = "general",
            daily_notes = {
                folder = "journal",
                date_format = "%Y-%m-%d",
            },
            completion = {
                nvim_cmp = true,
                min_chars = 1,
                new_notes_location = "notes_subdir",
            },
        })
    end
}
