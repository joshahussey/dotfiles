local oil = require("oil")
local M = {}

M.sign_hlgroups = {
	target_linehl = { bg = "#0f0f0f", fg = "#a80707" },
	target_numnl = { bg = "#0f0f0f", fg = "#a80707" },
	target_texthl = { bg = "#0f0f0f", fg = "#a80707" },
	target_culhl = { bg = "#0f0f0f", fg = "#a80707" },
	destination_linehl = { bg = "#0f0f0f", fg = "#1aa807" },
	destination_numhl = { bg = "#0f0f0f", fg = "#1aa807" },
	destination_texthl = { bg = "#0f0f0f", fg = "#1aa807" },
	destination_culhl = { bg = "#0f0f0f", fg = "#1aa807" },
}

M.sign_icons = {
	target = "󰿡",
	destination = "󰓾",
}

M.current_marks = {}

M.overwrite_sign_icons = function(table)
	for key, group in pairs(table) do
		if not M.sign_icons[key] == nil then
			M.sign_icons[key] = group
		end
	end
end

M.overwrite_sign_hlgroups = function(table)
	for key, group in pairs(table) do
		if not M.sign_highlights[key] == nil then
			M.sign_highlights[key] = group
		end
	end
end

for group, colors in pairs(M.sign_hlgroups) do
	vim.api.nvim_set_hl(0, group, { bg = colors.bg, fg = colors.fg })
end

M.signs = {
	{
		name = "target_file_or_dir",
		text = M.sign_icons.target,
		texthl = "target_texthl",
		linehl = "target_linehl",
		numhl = "target_numhl",
		culhl = "target_culhl",
	},
	{
		name = "destination_dir",
		text = M.sign_icons.destination,
		texthl = "destination_texthl",
		linehl = "destination_linehl",
		numhl = "destination_numhl",
		culhl = "destination_culhl",
	},
}

vim.fn.sign_define(M.signs)

M.targets = {}

function Clear_oil_targets()
	for i in pairs(M.targets) do
		M.targets[i] = nil
	end
    for target_or_dir, sign in pairs(M.current_marks) do
        vim.fn.sign_unplace("oil-extend", {id=sign})
        M.current_marks[target_or_dir] = nil
    end
end

function Mark_oil_source_target()
	local target = oil.get_cursor_entry()
	for _, data in ipairs(M.targets) do
		if data.name == target.name and data.type == target.type then
			print(target.type .. " " .. target.name .. " already targeted")
			return
		end
	end
	local sign = vim.fn.sign_place(
		0,
		"oil-extend",
		"target_file_or_dir",
		vim.api.nvim_get_current_buf(),
		{ lnum = vim.fn.line("."), priority = 100 }
	)
	M.current_marks[target.name] = sign
	target.path = oil.get_current_dir() .. target.name
	table.insert(M.targets, target)
	oil.save()
end

function Remove_oil_target()
	local target = oil.get_cursor_entry()
	for index, data in ipairs(M.targets) do
		if data.name == target.name then
			table.remove(M.targets, index)
			vim.fn.sign_unplace("oil-extend", { id=M.current_marks[target.name]})
            M.current_marks[target.name] = nil
			return
		end
	end
    if target == vim.fn.get_current_dir() .. M.destination .. "/" then
        vim.fn.sign_unplace("oil-extend", { id=M.current_marks[M.destination]})
        M.current_marks[M.destination] = nil
        M.destination = nil
        return
    end
	print(target.type .. " " .. target.name .. " has not been targeted")
end

function Mark_oil_destination_target()
	if M.destination ~= nil then
		vim.fn.sign_unplace("oil-extend",{ id=M.current_marks[M.destination]})
        M.current_marks[M.destination] = nil
	end
	local destination = oil.get_cursor_entry()
	for _, data in ipairs(M.targets) do
		if data.name == destination.name and data.type == "directory" then
			print(
				destination.type
					.. " "
					.. destination.name
					.. " is a source and therefore cannot be the destination. Please remove it to mark as destination"
			)
			return
		end
		if data.name == destination.name and data.type == "file" then
			local cwd = oil.get_current_dir()
			for _, datadir in ipairs(M.targets) do
				if datadir.path == cwd then
					print(
						"Destination cannot be a file, but cannot use current working directory as "
							.. destination.type
							.. " "
							.. destination.name
							.. " is a source and therefore cannot be the destination. Please remove it to mark as destination"
					)
					return
				end
			end
			return
		end
	end
	local destination_path = oil.get_current_dir()
	if destination.type == "file" then
		print("Destination cannot be a file, using current directory instead")
	end
	if destination.type == "directory" then
		destination_path = destination_path .. destination.name .. "/"
	end
	local sign = vim.fn.sign_place(
		0,
		"oil-extend",
		"destination_dir",
		vim.api.nvim_get_current_buf(),
		{ lnum = vim.fn.line("."), priority = 100 }
	)
	M.destination = destination_path
    M.current_marks[M.destination] = sign
	print("Destination set to " .. M.destination)
end

function Oil_move()
	if M.destination == nil then
		print("Destination not set")
		return
	end
	for _, data in ipairs(M.targets) do
		print("Moving " .. data.name .. " to " .. M.destination)
		os.execute("mv " .. data.path .. " " .. M.destination)
	end
	Clear_oil_targets()
	M.destination = nil
	oil.save()
end

function Oil_copy()
	if M.destination == nil then
		print("Destination not set")
		return
	end
	for _, data in ipairs(M.targets) do
		print("Copying " .. data.name .. " to " .. M.destination)
		os.execute("cp -r " .. data.path .. " " .. M.destination)
	end
	Clear_oil_targets()
	M.destination = nil
	oil.save()
end

function Print_table(table)
	for index, data in ipairs(table) do
		print(index)

		for key, value in pairs(data) do
			print("\t", key, value)
		end
	end
end
