local jdtls_dir = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local config_dir = jdtls_dir .. "/config_linux"
local plugins_dir = jdtls_dir .. "/plugins/"
local path_to_jar = plugins_dir .. "org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar"
local path_to_lombok = jdtls_dir .. "/lombok.jar"
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".java.flag" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	return
end
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = "/workspace/" .. project_name
local wesString = string.find(root_dir, "/home/josh/Documents/WES/WebEnterpriseSuite", 1, true)
if wesString ~= nil then
	root_dir = "/home/josh/Documents/WES/WebEnterpriseSuite"
	workspace_dir = "/home/josh/eclipse-workspace/"
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local bundles = {}
vim.list_extend(
	bundles,
	vim.split(
		vim.fn.glob(
			"/home/josh/.m2/repository/com/microsoft/java/com.microsoft.java.debug.plugin/0.46.0/com.microsoft.java.debug.plugin-*.jar",
			1
		),
		"\n"
	)
)
--JDTLS config
local config = {
	cmd = {
		"/usr/lib/jvm/java-1.17.0-openjdk-amd64/bin/java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. path_to_lombok,
		"-Xmx12g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		path_to_jar,
		"-configuration",
		config_dir,
		"-data",
		workspace_dir,
	},
	root_dir = root_dir,
	capabilities = capabilities,
	settings = {
		java = {
			home = "/usr/lib/jvm/java-17-openjdk-amd64/",
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				runtimes = {
					{
						name = "JavaSE-1.8",
						path = "/usr/lib/jvm/java-1.8.0-openjdk-amd64/",
						default = true,
					},
					{
						name = "JavaSE-11",
						path = "/usr/lib/jvm/java-11-openjdk-amd64/",
					},
					{
						name = "JavaSE-19",
						path = "/usr/lib/jvm/java-19-openjdk-amd64/",
					},
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-1.17.0-openjdk-amd64/",
					},
				},
			},
			maven = {
				downloadSources = true,
				downloadJavadocs = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			refenencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			format = {
				enabled = true,
				setting = {
					url = vim.fn.stdpath("config") .. "lang-servers/intellij-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},
		},
		signatureHelp = { enabled = true },
		contentProvider = { preferred = "fernflower" },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
		},
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
		flags = {
			allow_icremental_sync = true,
		},
	},
	init_options = {
		bundles = bundles,
	},
}
config["on_attach"] = function(client, bufnr)
	require("jdtls").setup_dap({ hotcodereplace = "auto" })
	require("jdtls").setup.add_commands()
	require("misc.remap").lsp_keymaps(bufnr)
	require("misc.remap").debug_keys()
	vim.lsp.codelens.refresh()
end
require("jdtls").start_or_attach(config)
