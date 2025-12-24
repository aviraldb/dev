return {
    {
      'neovim/nvim-lspconfig',
      dependencies = { 'saghen/blink.cmp' },
      opts = {
        servers = {
            -- Add the language servers here
            lua_ls = {},
            ts_ls = {},
            arduino_language_server = {},
            bashls = {},
            ast_grep = {},
            jdtls = {},
            zls = {},
            tailwindcss = {},
            dockerls = {},
            grammarly = {},
            phpactor = {},
            opencl_ls = {},
            glsl_analyzer = {},
            clangd = {},
            ccls = {},
            rust_analyzer = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                    },
                },
            pyright = {},
            basedpyright = {},
        }
      },
      config = function(_, opts)
        local lspconfig = require('lspconfig')
        for server, config in pairs(opts.servers) do
          config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
          lspconfig[server].setup(config)
        end
      end
    }
}
