return { -- LSP Configuration & Plugins
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		-- Automatically install LSPs to stdpath for neovim
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- ul status updates for LSP
		-- "j-hui/fidget.nvim",

		-- Additional lua configuration, makes nvim stuff amazing
		"folke/neodev.nvim",
	},
}
