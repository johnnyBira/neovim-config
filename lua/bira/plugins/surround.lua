return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "BufRead", -- Optional lazy loading with `ft` event
	config = function()
		require("nvim-surround").setup()
	end,
}
