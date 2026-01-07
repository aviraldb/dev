return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"lua",
				"javascript",
				"java",
				"rust",
				"c",
				"cpp",
				"css",
				"bash",
				"asm",
				"go",
				"toml",
				"typescript",
                "python",
				"sql",
				"zig",
				"php",
				"vim",
				"vimdoc",
				"markdown_inline",
				"arduino",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
