return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    build = ":TSUpdate",
    config = function()
        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
        parser_config.antout = {
            install_info = {
                url = "/opt/projects/tree-sitter-antout", -- local path or git repo
                files = { "src/parser.c" },
                generate_requires_npm = false,
                requires_generate_from_grammar = false,
                -- optional entries:
            },
            filetype = "antout", -- if filetype does not match the parser name
        }

        require 'nvim-treesitter.configs'.setup {
            ensure_installed = { "javascript", "typescript", "java", "python", "html", "css", "c", "lua", "vim", "rust" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'markdown' },
            },
            require("ts_context_commentstring").setup()
        }
    end
}
