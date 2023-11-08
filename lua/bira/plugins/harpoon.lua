return {
	"ThePrimeagen/harpoon",
	keys = "<leader>h",
	config = function()
		require("harpoon").setup()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>hl", ui.toggle_quick_menu, { desc = "[H]arpoon [L]ist", noremap = true })
		vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "[H]arpoon [A]dd", noremap = true })
		vim.keymap.set("n", "<leader>hr", mark.rm_file, { desc = "[H]arpoon [R]emove", noremap = true })
	end,
}
