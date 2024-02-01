return {
    "rcarriga/nvim-dap-ui",
    config = function()
        local dapui = require("dapui")
        dapui.setup({
            layouts = {
                {
                    elements = {
                        {
                            id = "scopes",
                            size = 1.0,
                        },
                    },
                    position = "right",
                    size = 0.3,
                },

                {
                    elements = {
                        {
                            id = "repl",
                            size = 0.2,
                        },
                        {
                            id = "console",
                            size = 0.5,
                        },
                    },
                    position = "bottom",
                    size = 0.15
                },

                {
                    elements = {
                        {
                            id = "watches",
                            size = 0.4,
                        },
                        {
                            id = "breakpoints",
                            size = 0.3,
                        },
                        {
                            id = "stacks",
                            size = 0.3,
                        },
                    },
                    position = "left",
                    size = 0.175
                },

            },
        })
    end
}
