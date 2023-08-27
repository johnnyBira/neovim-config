return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = { "LazyGit" },
	config = function()
		require("lazygit").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		})
		vim.api.nvim_set_keymap("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
	end,
}
