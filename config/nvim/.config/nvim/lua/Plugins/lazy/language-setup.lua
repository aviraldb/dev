-- this module provide full support to languages with
-- lsps, formatters, and linters, also providing basic
-- lsp functionalities like auto complete using
-- "saghen/blink.nvim" plugin.
-- The formatters, lsps, and linters are downloaded with
-- mason plugins, and this process is automated by
-- these in "Plugins.config.lang-tools" file

return {
	{ -- Mason LSP package manager
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
					check_outdated_package_on_open = true,
					border = "single",
					backdrop = 80,
					width = 0.75,
					height = 0.60,
				},
			})
		end,
	},
	{ -- Mason LSP Bridge
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local lang_tools = require("Plugins.config.lang-tools")

			-- Collect all LSP servers
			local lsp_servers = {}
			for lang, tools in pairs(lang_tools) do
				if tools.lsp then
					if type(tools.lsp) == "table" then
						for _, server in ipairs(tools.lsp) do
							if not vim.tbl_contains(lsp_servers, server) then
								table.insert(lsp_servers, server)
							end
						end
					else
						if not vim.tbl_contains(lsp_servers, tools.lsp) then
							table.insert(lsp_servers, tools.lsp)
						end
					end
				end
			end

			require("mason-lspconfig").setup({
				ensure_installed = lsp_servers,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local lang_tools = require("Plugins.config.lang-tools")
			local lspconfig = require("lspconfig")

			-- Setup each LSP server with its config
			for lang, tools in pairs(lang_tools) do
				if tools.lsp then
					local servers = type(tools.lsp) == "table" and tools.lsp or { tools.lsp }

					for _, server in ipairs(servers) do
						local config = tools.lsp_config or {}
						-- Add blink.cmp capabilities
						config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
						lspconfig[server].setup(config)
					end
				end
			end
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local lang_tools = require("Plugins.config.lang-tools")
			local null_ls = require("null-ls")
			local builtin = null_ls.builtins

			local sources = {}

			-- Collect formatters and linters
			for lang, tools in pairs(lang_tools) do
				-- Add formatters
				if tools.fmt then
					local formatters = type(tools.fmt) == "table" and tools.fmt or { tools.fmt }
					for _, formatter in ipairs(formatters) do
						local builtin_formatter = builtin.formatting[formatter]
						if builtin_formatter then
							table.insert(sources, builtin_formatter)
						end
					end
				end

				-- Add linters/diagnostics
				if tools.lint then
					local linters = type(tools.lint) == "table" and tools.lint or { tools.lint }
					for _, linter in ipairs(linters) do
						local builtin_linter = builtin.diagnostics[linter]
						if builtin_linter then
							table.insert(sources, builtin_linter)
						end
					end
				end
			end

			-- Setup null-ls
			null_ls.setup({
				sources = sources,
				debug = false,
				on_attach = function(client, bufnr)
					-- Auto-format on save
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = vim.api.nvim_create_augroup("NullLsFormatter", { clear = true }),
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,
	},
}
