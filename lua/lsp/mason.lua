local M = {}

function M.mason()
	local settings = require("mason").setup({
		ui = {
			border = "rounded",
			icons = {
				package_installed = "◍",
				package_pending = "◍",
				package_uninstalled = "◍",
			},
		},
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
	})
	return settings
end

return M

--[[local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end
local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
	"tsserver",
	"cssmodules_ls",
	"emmet_ls",
	"html",
	"lua_ls",
	"solargraph",
	"clangd",
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		-- getting "on_attach" and capabilities from handlers
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

	-- get the server name
	server = vim.split(server, "@")[1]

	-- pass them to lspconfig
	lspconfig[server].setup(opts)
end
--]]
