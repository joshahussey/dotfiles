require("typescript").setup({
    server = {
        on_attach = function(client, bufnr)
            require("misc.remap").lsp_keymaps(bufnr)
            vim.lsp.buf.inlay_hint(bufnr, true)
        end,
    },
})
