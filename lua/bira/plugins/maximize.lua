return {
	"declancm/maximize.nvim",
	keys = {
		"<leader>z",
	},
	config = function()
		local maximize = require("maximize")
		maximize.setup()

		vim.keymap.set("n", "<leader>z", ":Maximize<CR>", { silent = true })
	end,
}
