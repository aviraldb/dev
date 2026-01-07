return {
    {   -- Mason LSP package manager
        "mason-org/mason.nvim",
        config = function ()
            require ("Plugins.config.mason")
        end
    },
	{   -- Mason LSP Bridge
		"williamboman/mason-lspconfig.nvim",
		config = function()
            require ("Plugins.config.mason-lsp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
            require ("Plugins.config.lspconfig")
		end,
	},
}
