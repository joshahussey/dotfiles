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
