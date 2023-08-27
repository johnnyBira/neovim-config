return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")

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
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						prompt_position = "top",
					},
				},
				file_ignore_patterns = { ".git", "node_modules", "target", "dist", "build" },
			},
		})

		-- telescope keymaps
		vim.keymap.set(
			"n",
			"<leader>?",
			require("telescope.builtin").oldfiles,
			{ desc = "[?] Find recently opened files" }
		)
		vim.keymap.set(
			"n",
			"<leader><space>",
			require("telescope.builtin").buffers,
			{ desc = "[ ] Find existing buffers" }
		)
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer]" })

		vim.keymap.set("n", "<leader>fc", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			require("telescope.builtin").find_files({
				cwd = "~/.config/nvim",
				prompt_title = "[S]earch [C]onfigs]",
			})
		end, { desc = "[S]earch [C]onfigs" })

		vim.keymap.set("n", "<leader>ff", function()
			require("telescope.builtin").find_files({
				prompt_title = "[S]earch [F]iles",
				hidden = true,
			})
		end, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "[G]it [S]tatus" })
		vim.keymap.set("n", "<leader>gb", require("telescope.builtin").git_branches, { desc = "[G]it [B]ranches" })
		vim.keymap.set("n", "<leader>gc", require("telescope.builtin").git_bcommits, { desc = "[G]it [C]ommits" })
		vim.keymap.set("n", "<leader>fk", require("telescope.builtin").keymaps, { desc = "[F]ind [K]eymaps" })
		vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, { desc = "[F]ind current [W]ord" })
		vim.keymap.set("n", "<leader>fg", function()
			require("telescope.builtin").live_grep({
				additional_args = function(opts)
					return { "--hidden" }
				end,
			})
		end, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

		vim.keymap.set("n", "<leader>fr", function()
			require("telescope.builtin").lsp_references({ show_line = false })
		end, { desc = "[F]ind [R]eferences" })

		-- Enable telescope fzf native, if installed
		pcall(require("telescope").load_extension, "fzf")
	end,
}
