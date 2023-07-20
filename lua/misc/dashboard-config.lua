local M = {}
M.config = {
	theme = "hyper",
	disable_move = true,
	shortcut_type = "number",
	change_to_vcs_root = true,
	config = {
		header = {},
		shortcut = {
			{
				desc = "WES",
				key = "w",
				action = 'lua require("misc.dashboard-config").wes()',
			},
			{
				desc = "CESIUM",
				key = "c",
				action = 'lua require("misc.dashboard-config").cesium()',
			},
            {
                desc = "OPT",
                key = "o",
                action = 'lua require("misc.dashboard-config").opt()',
            },
            {
                desc = "CONFIG",
                key = "s",
                action = 'lua require("misc.dashboard-config").setup()',
            },
		},
		footer = {},
	},
	hide = {
		statusline = false,
		tabline = true,
		winbar = true,
	},
}
M.wes = function()
    vim.cmd([[lua require('oil').open('/home/josh/Documents/WES/WebEnterpriseSuite')]])
    vim.cmd([[cd /home/josh/Documents/WES/WebEnterpriseSuite]])
end
M.cesium = function()
    vim.cmd([[lua require('oil').open('/home/josh/Documents/WES/WebEnterpriseSuite/wes/Cesium')]])
    vim.cmd([[cd /home/josh/Documents/WES/WebEnterpriseSuite]])
end
M.opt = function()
    vim.cmd([[lua require('oil').open('/opt')]])
    vim.cmd([[cd /opt]])
end
M.setup = function()
    vim.cmd([[lua require('oil').open('/home/josh/.config/nvim')]])
    vim.cmd([[cd /home/josh/.config/nvim]])
end
return M
