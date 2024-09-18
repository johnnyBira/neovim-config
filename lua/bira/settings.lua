vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of your init.lua (strongly advised)
--
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- highlight current line
vim.opt.cursorline = true

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

vim.o.relativenumber = true

-- set width of disagnostic popup
vim.diagnostic.open_float({ width = 80 })
vim.diagnostic.open_float({
	border = "single",
	width = 80,
})

vim.lsp.util.preview_location({ border = "single", width = 80 })

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		prefix = "",
		spacing = 0,
		max_width = 80,
	},
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

-- disable word wrap
vim.opt.wrap = false
-- enable vertical scroll
vim.opt.scrolloff = 8

-- * Activate autoupdate on exit
--  let g:tmux_navigator_save_on_switch = 1
--
-- * Disable vim->tmux navigation when the Vim pane is zoomed in tmux
--  let g:tmux_navigator_disable_when_zoomed = 1
--
-- * If the Vim pane is zoomed, stay zoomed when moving to another tmux pane
--  let g:tmux_navigator_preserve_zoom = 1
--
-- * Custom Key Bindings
--  let g:tmux_navigator_no_mappings = 1

-- ii* Disable vim->tmux navigation when the Vim pane is zoomed in tmux
vim.g.tmux_navigator_disable_when_zoomed = 1

-- spell check
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- tab spacing and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.conceallevel = 1

local pipepath = vim.fn.stdpath("cache") .. "/godot.pipe"
if not vim.loop.fs_stat(pipepath) then
	vim.fn.serverstart(pipepath)
end
