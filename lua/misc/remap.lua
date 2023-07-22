local function desc(description)
    return { noremap = true, silent = true, desc = description }
end
--Set MapLeader
vim.g.mapleader = " "
local M = {}
--LSP Remaps for "on_attach"
M.lsp_keymaps = function(bufnr)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc("LSP:Go to definition"))
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc("LSP:Hover"))
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc("LSP:Rename"))
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc("LSP:Open float"))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc("LSP:Call Hierachy"))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", desc("LSP:Workspace Symbol"))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>", desc("LSP:Diagnostic Float"))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc("LSP:Diagnostic Next"))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc("LSP:Diagnostic Previous"))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc("LSP:Code Action"))
	vim.api.nvim_buf_set_keymap(bufnr,"i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc("LSP:LSP: Signature Help"))
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>da", ":lua attach_to_debug()<CR>",desc('Debug: Attach'))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<F5>", ":lua require'dap'.continue()<CR>",desc('Debug: Continue'))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<F6>", ":lua require'dap'.step_over()<CR>",desc('Debug: Step Over'))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<F7>", ":lua require'dap'.step_into()<CR>",desc('Debug: Step Into'))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<F8>", ":lua require'dap'.step_out()<CR>",desc('Debug: Step Out'))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>",desc('Debug: Toggle Breakpoint'))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Condition: '))<CR>",desc('Debug: Conditional Breakpoint'))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>bl", ":lua require'dap'.set_breakpoint(nil,nil,vim.fn.input('Log: '))<CR>",desc('Debug: Log Point'))
	vim.api.nvim_buf_set_keymap(bufnr,"n", "<leader>dr", ":lua require'dap'.repl.open()<CR>",desc('Debug: Open REPL'))
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
	vim.keymap.set("n", "<leader>db", function()
		require("misc.debuggerui").toggle()
	end, desc("Debug: Toggle Debugger UI"))
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
    vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>ch", builtin.git_commits, desc("Telescope: Git Commits"))
    vim.keymap.set("n", "<leader>fc", builtin.git_bcommits, desc("Telescope: Git File Commit History"))
    vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, desc("Telescope: Find In File"))
    vim.keymap.set("n", "<leader>di", builtin.diagnostics, desc("Telescope: Diagnostics"))
    vim.keymap.set("n", "<leader>qf", builtin.quickfix, desc("Telescope: List Quickfix"))
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
    ["<C-s>"] = "actions.select_vsplit",
    ["<C-h>"] = "actions.select_split",
    ["<C-t>"] = "actions.select_tab",
    ["<C-v>"] = "actions.preview",
    ["<C-c>"] = "actions.close",
    ["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["<leader>cd"] = "actions.cd",
    ["~"] = "actions.tcd",
    ["<leader>h"] = "actions.toggle_hidden",
    ["<leader>t"] = "actions.open_terminal",
    ["<leader>mt"] = {callback = ':lua Mark_oil_source_target()<CR>'},
    ["<leader>md"] = {callback = ':lua Mark_oil_destination_target()<CR>'},
    ["<leader>mr"] = {callback = ':lua Remove_oil_target()<CR>'},
    ["<leader>mm"] = {callback = ':lua Oil_move()<CR>'},
    ["<leader>mc"] = {callback = ':lua Oil_copy()<CR>'},
    ["<leader>oc"] = {callback = ':lua Clear_oil_targets()<CR>'},
}

M.glow = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gl", require('misc.glow-functions').toggle(), desc("Toggle Glow"))
end

--Return to dashboard
vim.keymap.set("n", "<leader>hh", function()
    vim.cmd([[Dashboard]])
end, desc("Return to Dashboard"))
--Return to Netrw
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", require("oil").open, {desc = "Open Parent Directory"})
--Move and Indent lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--Not sure
vim.keymap.set("n", "J", "mzJ`z", desc("Join Lines"))
vim.keymap.set("n", "<C-d>", "<C-d>zz", desc("Jump Down Half Page"))
vim.keymap.set("n", "<C-u>", "<C-u>zz", desc("Jump Up Half Page"))
vim.keymap.set("n", "n", "nzzzv", desc("Jump to next match"))
vim.keymap.set("n", "N", "Nzzzv", desc("Jump to previous match"))
--buffer next/previous
vim.keymap.set("n", "<leader>[", "<cmd>:bprevious<CR>")
vim.keymap.set("n", "<leader>]", "<cmd>:bnext<CR>")
--CutCopyPaste
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], desc("Copy to clipboard"))
vim.keymap.set("n", "<leader>Y", [["+Y]], desc("Copy to clipboard"))
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- Copilot 'Accept'
vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("")', { expr = true, silent = true, script = true, desc = "Copilot Accept" })
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, desc("Format"))

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
