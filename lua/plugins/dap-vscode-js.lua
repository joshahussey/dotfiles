return {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
        require("dap-vscode-js").setup({
            -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            debugger_path = "/home/josh/.local/share/nvim/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
            -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
            adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
            log_file_path = "/home/josh/.local/share/nvim/site/dap_vscode_js.log",            -- Path for file logging
            -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
            log_console_level = vim.log.levels.ERROR,                                         -- Logging level for output to console. Set to false to disable console output.
        })
    end
}
