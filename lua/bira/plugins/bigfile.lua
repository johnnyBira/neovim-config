return {
	"LunarVim/bigfile.nvim",
	event = "BufReadPre",
	config = function()
		require("bigfile").setup()
	end,
}
