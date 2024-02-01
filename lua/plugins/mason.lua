return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "simrat39/rust-tools.nvim" },
    },
    config = function()
        local signs = { Error = "a", Warning = "a", Hint = "a", Information = "a" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
        local lsp = require("lspconfig")
        require("mason").setup({
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "",
                    package_pending = "󰦕",
                    package_uninstalled = "",
                },
            },
            log_level = vim.log.levels.INFO,
            max_concurrent_installers = 4,
        })
        require("mason-lspconfig").setup({
            automatic_installation = true,
            ensure_installed = {
                "tsserver",
                "lua_ls",
                "clangd",
                "jsonls",
            },
            settings = {
                lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
            handlers = {
                function(server_name)
                    lsp[server_name].setup({})
                end,
                ["lua_ls"] = function()
                    lsp.lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,
                ["rust_analyzer"] = function()
                    require("rust-tools").setup({})
                end,
                ["jdtls"] = function()
                end,
            },
        })
    end
}
