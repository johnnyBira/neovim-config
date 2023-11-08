return {
	"windwp/nvim-ts-autotag",
	ft = { "ts", "tsx" },
	config = function()
		require("nvim-ts-autotag").setup({})
	end,
}
