return {
	"lukas-reineke/indent-blankline.nvim",
	branch = "lua",
	config = function()
		require("indent_blankline").setup({
			char = "┊",
			show_trailing_blankline_indent = false,
			highlight_current_context = true,
			filetype_exclude = { "help", "packer", "NvimTree", "Trouble", "dashboard" },
			show_current_context = true,
		})
	end,
	event = "BufRead",
}
