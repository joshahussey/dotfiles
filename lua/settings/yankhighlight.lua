vim.api.nvim_set_hl(0, "yankhl", { bg = "#F4D06F" , fg = "black"  })
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="yankhl", timeout=200})
augroup END
]]
