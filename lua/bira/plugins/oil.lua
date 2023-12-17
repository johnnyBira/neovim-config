return {
	"stevearc/oil.nvim",
	keys = { "-", "<CMD>Oil<CR>" },
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			float = {
				-- Padding around the floating window
				padding = 10,
				border = "rounded",
				-- This is the config that will be passed to nvim_open_win.
				-- Change values here to customize the layout
				override = function(conf)
					return conf
				end,
			},
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["esc"] = "actions.close",
			},
		})

		vim.keymap.set("n", "-", oil.open_float, { desc = "Open parent directory" })
	end,
}
