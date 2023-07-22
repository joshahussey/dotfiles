require("oil").setup({
	columns = {
		"icon",
		"size",
		--"permissions",
	},
	buf_options = {
		buflisted = false,
		bufhidden = "hide",
	},
	win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "n",
	},
	default_file_explorer = true,
	restore_win_options = true,
	skip_confirm_for_simple_edits = false,
	delete_to_trash = false,
	trash_command = "trash-put",
	prompt_save_on_select_new_entry = true,
	keymaps = require("misc.remap").oil,
	use_default_keymaps = false,
	view_options = {
		show_hidden = true,
		is_hidden_file = function(name, bufnr)
			return vim.startswith(name, ".")
		end,
		is_always_hidden = function(name, bufnr)
			return false
		end,
	},
--[[	float = {
		padding = 2,
		max_width = 0,
		max_height = 0,
		border = "rounded",
		win_options = {
			winblend = 10,
			winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
		},
		override = function(conf)
			return conf
		end,
	},]]--
	preview = {
        width = 240,
	},
	progress = {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		width = nil,
		max_height = { 10, 0.9 },
		min_height = { 5, 0.1 },
		height = nil,
		border = "rounded",
		minimized_border = "none",
		win_options = {
			winblend = 0,
		},
	},
})
