return {
	"nvim-lualine/lualine.nvim",
	event = "BufRead",
	config = function()
		require("lualine").setup({
			options = {
				theme = "duskfox",
				component_separators = "|",
				section_separators = "",
				path = 1,
			},
			sections = {
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = "ff9e64" },
					},
				},
			},
		})
	end,
}
