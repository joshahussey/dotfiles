local dapui = require("dapui")
local M = {}

M.open = function()
    dapui.open()
end

M.close = function()
    dapui.close()
end

M.toggle = function()
    dapui.toggle()
end

return M
