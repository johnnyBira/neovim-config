return {
	"andythigpen/nvim-coverage",
	cmd = {
		"Coverage",
		"CoverageToggle",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("coverage").setup()
	end,
}
