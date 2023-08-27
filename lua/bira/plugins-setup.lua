local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("bira.plugins")
require("lazy").setup({

	-- 'gcc' to comment out lines
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	-- Surround text objects

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
})
