local M = {}
M.open_glow_preview_buffers = {}
M.current_bufnr = 0;

vim.api.nvim_create_autocmd("BufAdd", {
    pattern = "*.md",
	callback = function(ev)
        M.enter_markdown(ev)
    end
})

vim.api.nvim_create_autocmd("FileType", {
     callback = function(ev)
         local filetype = vim.bo.filetype
         if filetype ~= "glowpreview" then
             return
         end
         M.close_glowpreview(ev)
     end
})

M.enter_markdown = function(event)
        vim.schedule(function()
            require('settings.remap').glow(event.buf)
            vim.cmd("Glow")
            vim.bo[vim.api.nvim_get_current_buf()].filetype = "glowpreview"
        end)
end

M.close_glowpreview = function(event)
    vim.schedule(function()
        require('settings.remap').glow_preview(event.buf)
    end)
end
