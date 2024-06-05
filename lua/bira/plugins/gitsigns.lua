return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			signs = {
				add = { text = "+" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 0,
				ignore_whitespace = false,
			},
		})

		vim.keymap.set("n", "]g", ":Gitsigns next_hunk<CR>", { silent = true })
		vim.keymap.set("n", "[g", ":Gitsigns prev_hunk<CR>", { silent = true })
		vim.keymap.set("n", "<leader>gv", ":Gitsigns select_hunk<CR>", { silent = true })
		vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { silent = true })
		vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { silent = true })
	end,
}
