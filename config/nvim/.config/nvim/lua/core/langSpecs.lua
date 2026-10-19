local M = {}

-- LSP Servers Native
M.servers = {
    "lua_ls",        -- lua
    "clangd",        -- c, cpp
    "rust_analyzer", -- rust
    "gopls",         -- go
    "org",           -- org
    "qmlls",         -- qml
    "nil",           -- nix
    "expert",        -- elixir
    "taplo",         -- TOML
    "ymlls",         -- YAML
}

-- Treesitter parsers
M.parsers = {
    "rust",
    "c",
    "go",
    "elixir",
    "sql",
    "nix",
    "lua",
    "markdown",
    "markdown_inline",
    "latex",
    "python",
    "toml",
    "yaml",
    "bash",
    "qmljs",
    "cpp",
}

-- Formatters (Conform backend)
M.formatters = {
    go     = { "gofumpt", "goimports" },
    rust   = { "rustfmt" },
    elixir = { "mix" }, --bundled with elixir installation
    lua    = { "stylua" },
    python = { "ruff" },
    nix    = { "nixfmt" },
    c      = { "clang-format" },
    cpp    = { "clang-format" },
    toml   = { "taplo" },
}

-- Linters (nvim-lint backend)
M.linters = {
    go     = {},
    lua    = { "luacheck" },
    elixir = { "credo" },
    python = { "ruff" },
    nix    = { "statix" },
    c      = { "clangtidy" },
    cpp    = { "clangtidy" },
    yaml   = { "yamllint" },
}

-- Mason Packages
M.packages = {
    -- lsp
    "clangd",
    "gopls",
    "rust-analyzer",
    "expert",
    "lua-language-server",
    "qmlls",
    "nil",
    "taplo",
    "yaml-language-server",
    -- formatters
    "clang-format",
    "gofumpt",
    "goimports",
    "stylua",
    "ruff",
    "nixfmt",
    -- linters
    "golangci-lint",
    "luacheck",
    "statix",
    "yamllint",
}

return M
