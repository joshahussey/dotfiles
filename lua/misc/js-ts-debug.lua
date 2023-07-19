require("dap-vscode-js").setup({
	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
	debugger_path = "/home/josh/.local/share/nvim/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
	log_file_path = "/home/josh/.local/share/nvim/site/dap_vscode_js.log", -- Path for file logging
	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
	log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
})

for _, language in ipairs({ "typescript", "javascript" }) do
	require("dap").configurations[language] = {
		{
			type = "pwa-chrome",
			request = "attach",
			name = "Chrome Attach",
			port = 9222,
			address = "127.0.0.1",
			webRoot = "/home/josh/Documents/WES/WebEnterpriseSuite/build/webapps/",
			urlFilter = "http://josh-l-home:8888/*",
			sourceMaps = true,
			sourceMapPathOverrides = {
				["webpack:///src/3dMap.ts"] = "/home/josh/Documents/WES/WebEnterpriseSuite/wes/Cesium/WES/src/3dMap.ts",
			},
			trace = true,
		},
		{
			type = "pwa-chrome",
			request = "launch",
			name = "Launch Browser",
			sourceMaps = true,
			webRoot = "/home/josh/Documents/WES/WebEnterpriseSuite/",
			url = "http://josh-l-home:8888/wes/Client/index.jsp?entryPoint=ES_ANALYST",
			port = 9222,
			hostname = "josh-l-home",
			skipFiles = {
				"node_modules/**",
				"**node_modules/**",
			},
			resolveSourceMapLocations = {
				"!**/node_modules/**",
				"**/src/*",
				"**/wesFiles/*",
			},
			sourceMapPathOverrides = {
				["webpack:///src/*"] = "/home/josh/Documents/WES/WebEnterpriseSuite/wes/Cesium/src/*",
				["webpack:///wesFiles"] = "/home/josh/Documents/WES/WebEnterpriseSuite/wes/Cesium/wesFiles/*",
			},
			trace = true,
		},
	}
end
