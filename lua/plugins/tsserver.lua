return {
    "jose-elias-alvarez/typescript.nvim",
    config = function()
        require("typescript").setup({
            server = {
                on_attach = function(_, bufnr)
                    require("settings.remap").lsp_keymaps(bufnr)
                    --vim.lsp.buf.inlay_hint(bufnr, true)
                end,
            },
        })
    end
}
