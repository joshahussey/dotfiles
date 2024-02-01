function New_obsidian_note()
    local note_name = vim.fn.input("Note Name: ")
    vim.cmd(":ObsidianNew " .. note_name)
end

--Add obsidian remaps when in the vault and in a markdown file.
vim.api.nvim_create_autocmd("BufAdd", {
    pattern = "*.md",
    callback = function()
        vim.schedule(function()
            local vault_root = Find_root({ ".obsidian" })
            if not vault_root then
                return
            end
            require('settings.remap').obsidian(0)
        end)
    end,
})
