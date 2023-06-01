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

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- ul status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},

	-- Git related plugins
	{
		"tpope/vim-fugitive",
		lazy = true,
		cmd = {
			"Git",
			"G",
			"Gdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"GMove",
			"GDelete",
			"GBrowse",
			"GRemove",
			"GRename",
			"Glgrep",
			"Gedit",
		},
	},
	{ "tpope/vim-rhubarb", lazy = true, cmd = { "Gbrowse", "Gpull", "Gpush" } },
	{ "lewis6991/gitsigns.nvim", lazy = true, cmd = { "Gitsigns" } },
	{ "kdheepak/lazygit.nvim", lazy = true, cmd = { "LazyGit" } },
	-- Fancier statusline
	"nvim-lualine/lualine.nvim",
	-- Add indentation guides even on blank lines
	"lukas-reineke/indent-blankline.nvim",
	-- 'gc' to comment visual regions/lines
	"numToStr/Comment.nvim",
	-- 'gcc' to comment out lines
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- Detect tabstop and shiftwidth automatically
	"tpope/vim-sleuth",
	-- Surround text objects
	"kylechui/nvim-surround",
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		lazy = true,
		cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose", "NvimTreeFindFileToggle " },
	},

	-- Copilot
	{ "github/copilot.vim" },

	-- Bufferline
	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },

	-- Fuzzy Finder (files, lsp, etc)
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- Nacvigate between vim splits and tmux panes
	{ "christoomey/vim-tmux-navigator" },

	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	-- LSP diganostics, code actions, hover, formatting, etc
	{ "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-- Start screen for neovim
	{ "echasnovski/mini.nvim", branch = "stable" },

	-- nightfox theme
	"EdenEast/nightfox.nvim",
	{
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			require("rose-pine").setup()
			-- vim.cmd('colorscheme rose-pine')
		end,
	},

	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup()
		end,
	},
})
