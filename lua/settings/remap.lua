local function desc(description)
    return { noremap = true, silent = true, desc = description }
end
--Set MapLeader
vim.g.mapleader = " "
local M = {}
M.gitdiff = function()
    vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>diffget LOCAL<CR>", desc("Git: Choose LOCAL"))
    vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>diffget REMOTE<CR>", desc("Git: Choose REMOTE"))
end
--ToggleTerm
M.toggleterm = [[<C-T>]]

--Obsidian Note Taking
M.obsidian = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>o", "<cmd>ObsidianOpen<CR>", desc("Obsidian: Open"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "<cmd>ObsidianOpenLink<CR>", desc("Obsidian: Open Link"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>u", "<cmd>ObsidianUpdateLink<CR>", desc("Obsidian: Update Link"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>g", "<cmd>ObsidianGoto<CR>", desc("Obsidian: Goto"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>h", "<cmd>ObsidianBacklink<CR>", desc("Obsidian: Backlink"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>ObsidianClose<CR>", desc("Obsidian: Close"))
end
--Remap for prettier 
M.prettier_format = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>Prettier<CR>", desc("Prettier:Format"))
end
--LSP Remaps for "on_attach"
M.lsp_keymaps = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc("LSP:Go to definition"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc("LSP:Hover"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc("LSP:Rename"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc("LSP:Open float"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc("LSP:Call Hierachy"))
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>vws",
        "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
        desc("LSP:Workspace Symbol")
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>vd",
        "<cmd>lua vim.diagnostic.open_float()<CR>",
        desc("LSP:Diagnostic Float")
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "[d",
        "<cmd>lua vim.diagnostic.goto_next()<CR>",
        desc("LSP:Diagnostic Next")
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "]d",
        "<cmd>lua vim.diagnostic.goto_prev()<CR>",
        desc("LSP:Diagnostic Previous")
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>vca",
        "<cmd>lua vim.lsp.buf.code_action()<CR>",
        desc("LSP:Code Action")
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "i",
        "<C-h>",
        "<cmd>lua vim.lsp.buf.signature_help()<CR>",
        desc("LSP: Signature Help")
    )
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>da", ":lua attach_to_debug()<CR>", desc("Debug: Attach"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<F5>", ":lua require'dap'.continue()<CR>", desc("Debug: Continue"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<F6>", ":lua require'dap'.step_over()<CR>", desc("Debug: Step Over"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<F7>", ":lua require'dap'.step_into()<CR>", desc("Debug: Step Into"))
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<F8>", ":lua require'dap'.step_out()<CR>", desc("Debug: Step Out"))
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>b",
        ":lua require'dap'.toggle_breakpoint()<CR>",
        desc("Debug: Toggle Breakpoint")
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>B",
        ":lua require'dap'.set_breakpoint(vim.fn.input('Condition: '))<CR>",
        desc("Debug: Conditional Breakpoint")
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>bl",
        ":lua require'dap'.set_breakpoint(nil,nil,vim.fn.input('Log: '))<CR>",
        desc("Debug: Log Point")
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", desc("Debug: Open REPL"))
end
--CMP maps
M.cmp = function(cmp)
    return {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-c>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        --["<Right>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end, {
            "i",
            "s",
        }),
    }
end
--Debugger Remaps
M.debug_keys = function()
    vim.api.nvim_set_keymap("n", "<leader>db", function()
        require("pluginextension.debuggerui").toggle()
    end, desc("Debug: Toggle Debugger UI"))
end
--LazyGit
M.lazygit = function()
    vim.api.nvim_set_keymap("n", "<leader>gs", "", { callback = require('pluginextension.lazygit-cwd').lazygit, desc = "LazyGit: Toggle"})
    vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>LazyGitConfig<CR>", desc("LazyGit: Config"))
end
--Harpoon
M.harpoon = function(mark, ui)
    vim.api.nvim_set_keymap("n", "<leader>a",'',{ callback = mark.add_file, desc ="Harpoon: Add File"})
    vim.api.nvim_set_keymap("n", "<C-e>", '', { callback = ui.toggle_quick_menu, desc ="Harpoon: Toggle Quick Menu"})
    vim.api.nvim_set_keymap("n", "<C-h>", '', { callback = function() ui.nav_file(1) end, desc = "Harpoon: Nav File 0"})
    --vim.api.nvim_set_keymap("n", "<C-t>", '', { callback = function() ui.nav_file(2) end, desc = "Harpoon: Nav File 1"})
    vim.api.nvim_set_keymap("n", "<C-n>", '', { callback = function() ui.nav_file(2) end, desc = "Harpoon: Nav File 2"})
    vim.api.nvim_set_keymap("n", "<C-s>", '', { callback = function() ui.nav_file(3) end, desc = "Harpoon: Nav File 3"})
end
--Telescope
M.telescope = function(builtin)
    vim.api.nvim_set_keymap("n", "<leader>pb", '', { callback = builtin.buffers, desc = "Telescope: Buffers"})
    vim.api.nvim_set_keymap("n", "<leader>pf", '', { callback = builtin.find_files, desc = "Telescope: Find Files"})
    vim.api.nvim_set_keymap("n", "<C-p>", '', { callback = builtin.git_files, desc = "Telescope: Git Files"})
    vim.api.nvim_set_keymap("n", "<leader>lg", '', { callback = builtin.live_grep, desc = "Telescope: Live Grep"})
    vim.api.nvim_set_keymap("n", "<leader>fh", '', { callback = builtin.help_tags, desc = "Telescope: Help Tags"})
    vim.api.nvim_set_keymap("n", "<leader>ch", '', { callback = builtin.git_commits, desc = "Telescope: Git Commits"})
    vim.api.nvim_set_keymap("n", "<leader>fc", '', { callback = builtin.git_bcommits, desc = "Telescope: Git File Commit History"})
    vim.api.nvim_set_keymap("n", "<leader>/", '', { callback = builtin.current_buffer_fuzzy_find, desc = "Telescope: Find In File"})
    vim.api.nvim_set_keymap("n", "<leader>di", '', { callback = builtin.diagnostics, desc = "Telescope: Diagnostics"})
    vim.api.nvim_set_keymap("n", "<leader>qf", '', { callback = builtin.quickfix, desc = "Telescope: List Quickfix"})
    vim.api.nvim_set_keymap("n", "<leader>ps", '', {callback = function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, desc = "Telescope: Grep String"})
end
M.undotree = function()
    vim.api.nvim_set_keymap("n", "<leader>u", '', {callback = vim.cmd.UndotreeToggle, desc = "UndoTree: Toggle"})
end
M.oil = {
    ["<leader>pv"] = {callback = require("oil.actions").open, desc = "Oil: Open Parent Directory"},
    ["<CR>"] = {callback = require("oil.actions").select.callback, desc = "Oil: Select"},
    ["<C-s>"] = {callback = require("oil.actions").select_vsplit.callback, desc = "Oil: Vertical Split"},
    ["<C-h>"] = { callback = require("oil.actions").select_split.callback, desc = "Oil: Horizontal Split"},
    --["<C-t>"] = { callback = require("oil.actions").select_tab, desc = "Oil: Select Tab"},
    ["<C-v>"] = { callback = require("oil.actions").preview.callback, desc = "Oil: Preview"},
    ["<C-c>"] = { callback = require("oil.actions").close.callback, desc = "Oil: Close"},
    ["<C-l>"] = { callback = require("oil.actions").refresh.callback, desc = "Oil: Refresh"},
    ["-"] = { callback = require("oil.actions").parent.callback, desc = "Oil: Navigate to Parent"},
    ["_"] = { callback = require("oil.actions").open_cwd.callback, desc = "Oil: Open Current Working Directory"},
    ["<leader>cd"] = { callback = require("oil.actions").cd.callback, desc = "Oil: Change Directory"},
    ["~"] = { callback = require("oil.actions").tcd.callback, desc = "Oil: TCD"},
    ["<leader>h"] = { callback = require("oil.actions").toggle_hidden.callback, desc = "Oil: Toggle H"},
    ["<leader>t"] = { callback = require("oil.actions").open_terminal.callback, desc = "Oil: Open Terminal"},
    ["<leader>mt"] = { callback = ":lua Mark_oil_source_target()<CR>", desc = "Oil: Mark target" },
    ["<leader>md"] = { callback = ":lua Mark_oil_destination_target()<CR>", desc = "Oil: Mark destination" },
    ["<leader>mr"] = { callback = ":lua Remove_oil_target()<CR>", desc = "Oil: Remove target" },
    ["<leader>mm"] = { callback = ":lua Oil_move()<CR>", desc = "Oil: Move target(s) to destination" },
    ["<leader>mc"] = { callback = ":lua Oil_copy()<CR>", desc = "Oil: Copy target(s) to destination"},
    ["<leader>oc"] = { callback = ":lua Clear_oil_targets()<CR>", desc = "Oil: Clear targets" },
}

M.glow = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gl", require("pluginextension.glow-functions").toggle(), desc("Glow: Toggle Glow"))
end

M.glow_preview = function(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gl", require("pluginextension.glow-functions").toggle(), desc("Glow: Toggle Glow"))
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<leader>pv",
        ":lua require('pluginextension.glow-functions').test_open()<CR>",
        desc("Oil: Open Oil From Glow Preview")
    )
end

--Lazy Manager
vim.api.nvim_set_keymap("n", "<leader>lm", "", { callback = function() vim.cmd([[Lazy]]) end, desc = "Lazy: Lazy Manager" })

--New Obsidian Global Remaps
vim.api.nvim_set_keymap("n", "<leader>nn", "<cmd>lua New_obsidian_note()<CR>", desc("Obsidian: New Obsidian Note"))
vim.api.nvim_set_keymap("n", "<leader>nt", "<cmd>ObsidianToday<CR>", desc("Obsidian: Obsidian Today"))
vim.api.nvim_set_keymap("n", "<leader>ny", "<cmd>ObsidianYesterday<CR>", desc("Obsidian: Obsidian Yesterday"))
--Return to dashboard
vim.api.nvim_set_keymap("n", "<leader>hh", "", {callback = function() vim.cmd([[Dashboard]]) end, desc = "Dashboard: Return to Dashboard"})
--Return to Netrw
--vim.api.nvim_set_keymap("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap("n", "<leader>pv", "", {callback = require("oil").open, desc = "Oil: Open Parent Directory" })
--Move and Indent lines in visual mode
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", desc("Edit: Move Line Down"))
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", desc("Edit: Move Line Up"))
--Not sure
vim.api.nvim_set_keymap("n", "J", "mzJ`z", desc("Edit: Join Lines"))
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", desc("Move: Jump Down Half Page"))
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", desc("Move: Jump Up Half Page"))
vim.api.nvim_set_keymap("n", "n", "nzzzv", desc("Move: Jump to next match"))
vim.api.nvim_set_keymap("n", "N", "Nzzzv", desc("Move: Jump to previous match"))
--buffer next/previous
vim.api.nvim_set_keymap("n", "<leader>[", "<cmd>:bprevious<CR>", desc("Buffer: Previous"))
vim.api.nvim_set_keymap("n", "<leader>]", "<cmd>:bnext<CR>", desc("Buffer: Next"))
--CutCopyPaste
vim.api.nvim_set_keymap("x", "<leader>p", [["_dP]], desc("Paste: Paste Above"))
vim.api.nvim_set_keymap("n", "<leader>y", [["+y]], desc("Copy: Copy to clipboard"))
vim.api.nvim_set_keymap("v", "<leader>y", [["+y]], desc("Copy: Copy to clipboard"))
vim.api.nvim_set_keymap("n", "<leader>Y", [["+Y]], desc("Copy: Copy to clipboard"))
vim.api.nvim_set_keymap("n", "<leader>d", [["_d]], desc("Cut: Cut to clipboard"))
vim.api.nvim_set_keymap("v", "<leader>d", [["_d]], desc("Cut: Cut to clipboard"))
-- Copilot 'Accept'
vim.api.nvim_set_keymap(
    "i",
    "<C-a>",
    'copilot#Accept("")',
    { expr = true, silent = true, script = true, desc = "Copilot: Accept" }
)
-- This is going to get me cancelled
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", desc("Vim: Escape"))

--Trouble

vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>TroubleToggle<CR>", desc("Trouble: Toggle"))

vim.api.nvim_set_keymap("n", "Q", "<nop>", desc("Misc: Disable Ex Mode"))
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", desc("Tmux: Sessionizer"))
vim.api.nvim_set_keymap("n", "<leader>f", '', {callback = vim.lsp.buf.format, desc = "LSP: Format"})

vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>cnext<CR>zz", desc("Quickfix: Next"))
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>cprev<CR>zz", desc("Quickfix: Previous"))
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>lnext<CR>zz", desc("Location: Next"))
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>lprev<CR>zz", desc("Location: Previous"))
--Find and replace
vim.api.nvim_set_keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc("Edit: Find and Replace"))
--Make file executable
vim.api.nvim_set_keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Edit: Make executable", silent = true })
--ShoutOut
vim.api.nvim_set_keymap("n", "<leader><leader>", '', { callback = function() vim.cmd("so") end, desc = "Vim: Source Current File"})
--Remap Capslock to Esc
vim.api.nvim_set_keymap("i", "<CAPS>", "<Esc>", desc("Vim: Capslock to Escape"))

vim.api.nvim_set_keymap("n", "<F10>", "", {callback = require("pluginextension.java-debug").run_server_dev_mode, desc = "WES: Run Server Dev Mode"})
vim.api.nvim_set_keymap("n", "<F11>", "", {callback = require("pluginextension.java-debug").run_client_dev_mode, desc = "WES: Run Client Dev Mode"})
return M
