return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-dap",
        "j-hui/fidget.nvim",
    },
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            -- cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
            --     sources = {
            --         { name = "dap" },
            --     },
            -- })
            mapping = cmp.mapping.preset.insert(require('settings.remap').cmp(cmp)),
            sources = {
                { name = "luasnip" },
                { name = "dap" },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "dap" }
            },
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            -- experimental = {
            --     ghost_text = true,
            -- },
            -- enabled = function()
            --     return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            --         or require("cmp_dap").is_dap_buffer()
            -- end,
        })
        require("fidget").setup({
            lsp = {
                on_attach = function(client, bufnr)
                    require("lsp_signature").on_attach({
                        bind = true,
                        doc_lines = 2,
                        floating_window = true,
                        hint_enable = true,
                        hint_prefix = " ",
                        hint_scheme = "String",
                        use_lspsaga = false,
                        handler_opts = {
                            border = "rounded",
                        },
                    })
                end,
            },
        })

    end
}
