return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		telescope.setup({
			hidden = true,
			defaults = {
				mappings = {
					i = {
						["<C-u>"] = false,
						["<C-d>"] = false,
						-- navigation
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						-- scroll
						["<C-f>"] = actions.cycle_history_next,
						["<C-b>"] = actions.cycle_history_prev,
						-- quit
						["<Esc>"] = actions.close,
					},
				},
				-- omit git ignore files from search
				-- file_ignore_patterns = { ".git", "node_modules", "target", "dist", "build" },
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						prompt_position = "top",
					},
				},
				file_ignore_patterns = { "^.git/" },
			},
		})

		-- telescope keymaps
		vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
		vim.keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer]" })

		vim.keymap.set("n", "<leader>fc", function()
			-- You can pass additional configuration to telescope to change theme, layout, etc.
			builtin.find_files({
				cwd = "~/.config/nvim",
				prompt_title = "[S]earch [C]onfigs]",
			})
		end, { desc = "[S]earch [C]onfigs" })

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({
				prompt_title = "[S]earch [F]iles",
				additional_args = function()
					return { "--hidden" }
				end,
				hidden = true,
			})
		end, { desc = "[S]earch [F]iles" })

		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "[G]it [S]tatus" })
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "[G]it [B]ranches" })
		vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
		vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })
		vim.keymap.set({ "n", "v" }, "<leader>fg", function()
			builtin.live_grep({
				hidden = true,
				additional_args = function()
					return { "--hidden" }
				end,
			})
		end, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F] [D]iagnostics" })

		vim.keymap.set("n", "<leader>fr", function()
			builtin.lsp_references({ show_line = false })
		end, { desc = "[F]ind [R]eferences" })

		-- Enable telescope fzf native, if installed
		pcall(telescope.load_extension, "fzf")
	end,
}
