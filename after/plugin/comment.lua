require('nvim_comment').setup({
  comment_empty = false,
  marker_padding = true,
  create_mappings = true,
  line_mapping = "gcc",
  operator_mapping = "gc",
  hook = function()
      local filetype = vim.api.nvim_buf_get_option(0, "filetype")
      if filetype == "typescriptreact" or filetype == "javascriptreact" then
          require("ts_context_commentstring.internal").update_commentstring()
      end
  end
})
