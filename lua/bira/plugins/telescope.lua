local ok, telescope = pcall(require, "telescope")

if not ok then
	return
end

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
				-- navigation
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				-- scroll
				["<C-f>"] = require("telescope.actions").cycle_history_next,
				["<C-b>"] = require("telescope.actions").cycle_history_prev,
				-- quit
				["<Esc>"] = require("telescope.actions").close,
			},
		},
		-- omit git ignore files from search
		file_ignore_patterns = { ".git", "node_modules", "target", "dist", "build" },
	},
})

-- telescope keymaps
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sc", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").find_files({
		cwd = "~/.config/nvim",
		prompt_title = "[S]earch [C]onfigs]",
	})
end, { desc = "[S]earch [C]onfigs" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sl", require("telescope.builtin").git_status, { desc = "[S]earch Git [L]og" })
vim.keymap.set("n", "<leader>sl", require("telescope.builtin").git_branches, { desc = "[S]earch Git [B]ranches" })
vim.keymap.set("n", "<leader>sk", require("telescope.builtin").keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").lsp_references, { desc = "[S]earch [R]eferences" })

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")
