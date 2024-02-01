return {
    "nvim-telescope/telescope.nvim",
    version = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require('telescope.builtin')
        require("settings.remap").telescope(builtin)
    end
}
