function ColorMyPencils(color)
	color = "vim-monokai-tasty" or color
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", {bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none" })
end

ColorMyPencils()