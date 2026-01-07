return {
    function ()
        local builtin = require("null-ls").builtins
        require("null-ls").setup({
            sources = {
                -- Formatters
                builtin.formatting.shfmt, -- For Shell scripts
                builtin.formatting.rustfmt, -- for Rust
                builtin.formatting.black, -- For Python
                builtin.formatting.sort, -- python import organiser
                builtin.formatting.stylua, -- For Lua files
                builtin.formatting.prettier, -- A common formatter for JS, CSS, JSON, etc.
                builtin.formatting.zigfmt, -- zig

                -- Linters (Diagnostics)
                builtin.diagnostics.shellcheck, -- For Shell scripts
                builtin.diagnostics.clippy, -- for Rust
                builtin.diagnostics.mypy, -- For Python
                builtin.diagnostics.selene, -- For Lua
                builtin.diagnostics.markdownlint, -- For Markdown files
                builtin.diagnostics.eslint, -- For JavaScript and TypeScript
                builtin.diagnostics.powershell_analyser, -- Powershell 
                builtin.diagnostics.htmlhint, -- HTML 
                builtin.diagnostics.stylelint, -- CSS 
            },
            -- General options
            debug = false, -- Set to true to see debug output with :NullLsLog
            -- You can also configure individual sources
            on_attach = function(client, bufnr)
                -- Optional: A common setup is to auto-format on save
                if client.name == "null-ls" then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("NullLsFormatter", { clear = true }),
                        buffer = bufnr,
                        callback = function(args) -- The callback now accepts an `args` table
                            -- The buffer number is available in `args.buf`
                            vim.lsp.buf.format({ bufnr = args.buf })
                        end,
                    })
                end
            end,
        })
    end
}
