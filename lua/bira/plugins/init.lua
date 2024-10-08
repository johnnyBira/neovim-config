return {
	"tpope/vim-sleuth",
	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = false },
	{ "rose-pine/neovim", as = "rose-pine", event = "VeryLazy" },
	{ "tpope/vim-rhubarb", lazy = true, cmd = { "Gbrowse", "Gpull", "Gpush" } },
}
