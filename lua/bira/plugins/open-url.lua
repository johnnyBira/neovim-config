return {
	"sontungexpt/url-open",
	cond = false,
	keys = { "<CR>" },
	config = function()
		local status_ok, url_open = pcall(require, "url-open")
		if not status_ok then
			return
		end
		url_open.setup({})
		vim.keymap.set("n", "<CR>", "<ESC>:URLOpenUnderCursor<CR>", { silent = true })
	end,
}
