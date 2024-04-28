local vault_dir = "/Documents/Obsidian Vault"

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. vault_dir .. "/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. vault_dir .. "/**.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("obsidian").setup({
			dir = vim.fn.expand("~") .. vault_dir,
			open_app_foreground = true,
			enable = true, -- set to false to disable all additional syntax features
			update_debounce = 200, -- update delay after a text change (in milliseconds)
			templates = {
				subdir = "Templates",
			},
			ul = {
				checkboxes = {
					-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
					[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
					["x"] = { char = "", hl_group = "ObsidianDone" },
				},
			},
			daily_notes = {
				folder = "./Journal/Daily/",
				template = "./Daily Journal Entry.md",
			},
			follow_url_func = function(url)
				vim.fn.jobstart({ "open", url })
			end,
		})
		vim.keymap.set("n", "<leader>ot", ":ObsidianToday<CR>", { desc = "Create/Open todays note", silent = true })
		vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>", { desc = "Oopen current note", silent = true })
		vim.keymap.set("n", "<leader>fo", ":ObsidianSearch<CR>", { desc = "Open current note", silent = true })
		vim.keymap.set("n", "<leader>od", ":ObsidianToday<CR>", { desc = "Open todays note", silent = true })
		vim.keymap.set("n", "<leader>oy", ":ObsidianYesterday<CR>", { desc = "Open yesterdays note", silent = true })
	end,
}
