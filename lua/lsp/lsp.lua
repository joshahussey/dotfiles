require("lsp.mason").mason()
local remap = require("misc.remap")
local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
	"tsserver",
	"eslint",
	"jsonls",
})

local cmp_settings = require("lsp.cmp")
local cmp_mappings = remap.cmp_keymaps(lsp, cmp_settings.cmp, cmp_settings.cmp_select)
lsp.setup_nvim_cmp({ cmp_mappings })
lsp.nvim_workspace()
lsp.on_attach(function(client, bufnr)
	require("misc.remap").lsp_keymaps(bufnr)
end)
lsp.skip_server_setup({ "jdtls", "tsserver" })
lsp.setup()
