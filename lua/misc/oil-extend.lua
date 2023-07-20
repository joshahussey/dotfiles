local oil = require("oil")
local M = {}
M.targets = {}

function Clear_oil_targets()
    for i in pairs(M.targets) do
        M.targets[i] = nil;
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
    target.path = oil.get_current_dir() .. target.name
	table.insert(M.targets, target)
end

function Remove_oil_target()
    local target = oil.get_cursor_entry()
    for index, data in ipairs(M.targets) do
        if data.name == target.name then
            table.remove(M.targets, index)
            return
        end
    end
    print(target.type .. " " .. target.name .. " has not been targeted")
end

function Mark_oil_destination_target()
    local destination = oil.get_cursor_entry()
    for _, data in ipairs(M.targets) do
        if data.name == destination.name and data.type == "directory" then
            print(destination.type .. " " .. destination.name .. " is a source and therefore cannot be the destination. Please remove it to mark as destination")
            return
        end
        if data.name == destination.name and data.type == "file" then
            local cwd = oil.get_current_dir()
            for _, datadir in ipairs(M.targets) do
                if datadir.path == cwd then
                    print("Destination cannot be a file, but cannot use current working directory as " .. destination.type .. " " .. destination.name .. " is a source and therefore cannot be the destination. Please remove it to mark as destination")
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
         destination_path = destination_path ..  destination.name .. "/"
    end
    M.destination = destination_path
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
