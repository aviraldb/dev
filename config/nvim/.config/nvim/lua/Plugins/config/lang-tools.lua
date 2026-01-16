-- Language tools configuration
-- Format: lang = { fmt = "formatter", lsp = "lsp_server", lsp_config = {}, lint = "linter" }

return {
    lua = {
        fmt = "stylua",
        lsp = "lua_ls",
        lsp_config = {},
        lint = "selene",
    },
    
    python = {
        fmt = { "black", "isort" },
        lsp = { "pyright", "basedpyright" },
        lsp_config = {},
        lint = "mypy",
    },
    
    rust = {
        fmt = "rustfmt",
        lsp = "rust_analyzer",
        lsp_config = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
        lint = "clippy",
    },
    
    javascript = {
        fmt = "prettier",
        lsp = "ts_ls",
        lsp_config = {},
        lint = "eslint",
    },
    
    typescript = {
        fmt = "prettier",
        lsp = "ts_ls",
        lsp_config = {},
        lint = "eslint",
    },
    
    shell = {
        fmt = "shfmt",
        lsp = "bashls",
        lsp_config = {},
        lint = "shellcheck",
    },
    
    zig = {
        fmt = "zigfmt",
        lsp = "zls",
        lsp_config = {},
    },
    
    nix = {
        fmt = "nixfmt",
        lsp = "nil_ls",
        lsp_config = {},
        lint = "nil_ls",
    },
    
    markdown = {
        fmt = "prettier",
        lint = "markdownlint",
    },
    
    html = {
        fmt = "prettier",
        lint = "htmlhint",
    },
    
    css = {
        fmt = "prettier",
        lint = "stylelint",
    },
    
    tailwindcss = {
        lsp = "tailwindcss",
        lsp_config = {},
    },
    
    java = {
        lsp = "jdtls",
        lsp_config = {},
    },
    
    php = {
        lsp = "phpactor",
        lsp_config = {},
    },
    
    c = {
        lsp = "clangd",
        lsp_config = {},
    },
    
    cpp = {
        lsp = "clangd",
        lsp_config = {},
    },
    
    ccls = {
        lsp = "ccls",
        lsp_config = {},
    },
    
    opencl = {
        lsp = "opencl_ls",
        lsp_config = {},
    },
    
    glsl = {
        lsp = "glsl_analyzer",
        lsp_config = {},
    },
    
    arduino = {
        lsp = "arduino_language_server",
        lsp_config = {},
    },
    
    docker = {
        lsp = "dockerls",
        lsp_config = {},
    },
    
    powershell = {
        lint = "powershell_analyser",
    },
    
    -- Generic tools
    grammar = {
        lsp = "grammarly",
        lsp_config = {},
    },
    
    ast = {
        lsp = "ast_grep",
        lsp_config = {},
    },
}
