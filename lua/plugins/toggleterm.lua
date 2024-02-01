return {
    "akinsho/toggleterm.nvim",
    version = '*',
    config = function()
        require('toggleterm').setup({
            open_mapping = require('settings.remap').toggleterm,
            direction = 'horizontal',
            size = 13,
            autoclose = true,
        });
    end
}
