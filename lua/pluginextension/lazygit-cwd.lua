local M = {}
M.lazygit = function()
    local prev_dir = vim.fn.getcwd()
    local cur_dir = vim.fn.expand('%:p:h')
    local filetype = vim.bo.filetype
    if filetype == 'oil' then
       cur_dir = cur_dir:sub(7)
    end
    vim.cmd('cd '..cur_dir)
    vim.cmd('LazyGit')
    vim.cmd('cd '..prev_dir)
end
return M
