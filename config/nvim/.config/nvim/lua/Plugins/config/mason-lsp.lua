return {
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "ts_ls",
            "arduino_language_server",
            "bashls",
            "ast_grep",
            "jdtls",
            "zls",
            "tailwindcss",
            "dockerls",
            "grammarly",
            "phpactor",
            "opencl_ls",
            "glsl_analyzer",
            "clangd",
            "rust_analyzer",
            "pyright",
            "basedpyright"
        },
    })
}
