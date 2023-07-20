--Set MapLeader
vim.g.mapleader = " "
local M = {}
--LSP Remaps for "on_attach"
M.lsp_keymaps = function(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
	vim.keymap.set("n", "<leader>da", ":lua attach_to_debug()<CR>")
	vim.keymap.set("n", "<F5>", ':lua require"dap".continue()<CR>')
	vim.keymap.set("n", "<F6>", ':lua require"dap".step_over()<CR>')
	vim.keymap.set("n", "<F7>", ':lua require"dap".step_into()<CR>')
	vim.keymap.set("n", "<F8>", ':lua require"dap".step_out()<CR>')
	vim.keymap.set("n", "<leader>b", ':lua require"dap".toggle_breakpoint()<CR>')
	vim.keymap.set("n", "<leader>B", ':lua require"dap".set_breakpoint(vim.fn.input("Condition: "))<CR>')
	vim.keymap.set("n", "<leader>bl", ':lua require"dap".set_breakpoint(nil,nil,vim.fn.input("Log: "))<CR>')
	vim.keymap.set("n", "<leader>dr", ':lua require"dap".repl.open()<CR>')
end
--CMP Remards for "on_attach"
M.cmp_keymaps = function(lsp, cmp, cmp_select)
	lsp.defaults.cmp_mappings({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	})
end
--Debugger Remaps
M.debug_keys = function()
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<leader>db", function()
		require("misc.debuggerui").toggle()
	end, opts)
end
--LazyGit
M.lazygit = function()
	vim.keymap.set("n", "<leader>gs", "<cmd>LazyGit<CR>")
	vim.keymap.set("n", "<leader>gc", "<cmd>LazyGitConfig<CR>")
end
--Harpoon
M.harpoon = function(mark, ui)
	vim.keymap.set("n", "<leader>a", mark.add_file)
	vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

	vim.keymap.set("n", "<C-h>", function()
		ui.nav_file(1)
	end)
	vim.keymap.set("n", "<C-t>", function()
		ui.nav_file(2)
	end)
	vim.keymap.set("n", "<C-n>", function()
		ui.nav_file(3)
	end)
	vim.keymap.set("n", "<C-s>", function()
		ui.nav_file(4)
	end)
end
--Telescope
M.telescope = function(builtin)
	vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
	vim.keymap.set("n", "<C-p>", builtin.git_files, {})
	vim.keymap.set("n", "<leader>ps", function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end)
end
M.undotree = function()
	vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
end
M.oil = {
    ["<leader>pv"] = "actions.open",
    ["<CR>"] = "actions.select",
    ["<C-s>"] = "actions.select_vaplit",
    ["<C-h>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-p>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["<leader>cd"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["<leader>h"] = "actions.toggle_hidden",
    ["<leader>t"] = "actions.open_terminal"
}
--Return to dashboard
vim.keymap.set("n", "<leader>db", function()
    vim.cmd([[Dashboard]])
end)
--Return to Netrw
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", require("oil").open, {desc = "Open Parent Directory"})
--Move and Indent lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--Not sure
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--buffer next/previous
vim.keymap.set("n", "<leader>[", "<cmd>:bprevious<CR>")
vim.keymap.set("n", "<leader>]", "<cmd>:bnext<CR>")
--CutCopyPaste
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- Copilot 'Accept'
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("")', { expr = true, silent = true, script = true })
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--Find and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--ShoutOut
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)
--Remap Capslock to Esc
vim.keymap.set("i", "<CAPS>", "<Esc>")

return M
