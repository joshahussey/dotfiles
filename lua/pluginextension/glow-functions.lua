local M = {}
M.toggle = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local cmd_string = ":Glow<CR>"
	if vim.api.nvim_buf_get_option(bufnr, "filetype") == "glowpreview" then
		cmd_string = ":Glow!<CR>"
	end
	return cmd_string
end
M.open_oil = function()
	local cmd_string = ":lua require('pluginextension.glow-functions').test_open()<CR>"
	return cmd_string
end
M.test_open = function()
   local bufnr = vim.api.nvim_get_current_buf()
   vim.api.nvim_buf_delete(bufnr, {force = true})
   vim.cmd([[lua require('oil').open()]])
end
return M
