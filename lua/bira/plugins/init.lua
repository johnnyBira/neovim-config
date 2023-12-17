return {
	-- 'gcc' to comment out lines
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = false },
	{ "catppuccin/nvim", name = "catppuccin", event = "VeryLazy" },
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("rose-pine").setup()
			-- vim.cmd('colorscheme rose-pine')
		end,
	},
	{ "tpope/vim-rhubarb", lazy = true, cmd = { "Gbrowse", "Gpull", "Gpush" } },
}
