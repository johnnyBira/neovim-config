return {
	"github/copilot.vim",
	event = "BufRead",
	config = function()
		-- I had some problems with tmux not sending the correct keycodes for Ctrl+Enter
		-- tmux is setup to send "‰" when I press Ctrl+Enter
		vim.keymap.set("i", "‰", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
		vim.keymap.set("i", "<C-l>", "<Plug>(copilot-next)")
		vim.keymap.set("i", "<C-h>", "<Plug>(copilot-previous)")
	end,
}
