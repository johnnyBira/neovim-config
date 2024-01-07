return {
	"ThePrimeagen/harpoon",
	keys = "<leader>h",
	config = function()
		require("harpoon").setup()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>hl", ui.toggle_quick_menu, { desc = "[H]arpoon [L]ist", noremap = true })
		vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "[H]arpoon [A]dd", noremap = true })
		vim.keymap.set("n", "<leader>hd", mark.rm_file, { desc = "[H]arpoon [D]elete", noremap = true })
		vim.keymap.set("n", "<leader>hn", ui.nav_next, { desc = "[H]arpoon [N]ext", noremap = true })
		vim.keymap.set("n", "<leader>hN", ui.nav_prev, { desc = "[H]arpoon [P]revious", noremap = true })
		-- setup mappings for navigation between marks 1-9
		for i = 1, 9 do
			vim.keymap.set("n", "<leader>h" .. i, function()
				ui.nav_file(i)
			end, { desc = "[H]arpoon [G]o to " .. i, noremap = true })
		end
	end,
}
