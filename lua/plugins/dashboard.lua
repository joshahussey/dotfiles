return {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require("dashboard").setup({
            theme = "hyper",
            disable_move = true,
            shortcut_type = "number",
            change_to_vcs_root = true,
            config = {
                header = {},
                shortcut = {
                    {
                        desc = "WES",
                        key = "w",
                        action = 'lua require("pluginextension.dashboard-functions").wes()',
                    },

                    {
                        desc = "CESIUM",
                        key = "c",
                        action = 'lua require("pluginextension.dashboard-functions").cesium()',
                    },

                    {
                        desc = "NOTES",
                        key = "n",
                        action = 'lua require("pluginextension.dashboard-functions").notes()',
                    },

                    {
                        desc = "OPT",
                        key = "o",
                        action = 'lua require("pluginextension.dashboard-functions").opt()',
                    },

                    {
                        desc = "CONFIG",
                        key = "s",
                        action = 'lua require("pluginextension.dashboard-functions").setup()',
                    },
                },
                footer = {},
            },
            hide = {
                statusline = false,
                tabline = true,
                winbar = true,
            },
        })
    end,
}
