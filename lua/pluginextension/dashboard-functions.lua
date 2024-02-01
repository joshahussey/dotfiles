local M = {}
M.wes = function()
	vim.cmd([[lua require('oil').open('/home/josh/Documents/WES/WebEnterpriseSuite')]])
	vim.cmd([[cd /home/josh/Documents/WES/WebEnterpriseSuite]])
end
M.cesium = function()
	vim.cmd([[lua require('oil').open('/home/josh/Documents/WES/WebEnterpriseSuite/wes/Cesium')]])
	vim.cmd([[cd /home/josh/Documents/WES/WebEnterpriseSuite]])
end
M.notes = function()
	vim.cmd([[lua require('oil').open('/home/josh/Documents/notes')]])
	vim.cmd([[cd /home/josh/Documents/notes]])
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
