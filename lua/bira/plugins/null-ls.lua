return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "BufReadPre",
	config = function()
		local null_ls = require("null-ls")

		-- if you want to set up formatting on save, you can use this as a callback
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local lsp_formatting = function(bufnr)
			vim.lsp.buf.format({
				filter = function(client)
					-- apply whatever logic you want (in this example, we'll only use null-ls)
					return client.name == "null-ls"
				end,
				bufnr = bufnr,
			})
		end

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.formatting.eslint_d,
				null_ls.builtins.code_actions.eslint_d,
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.astro,
				-- null_ls.builtins.code_actions.xo,
				-- null_ls.builtins.diagnostics.xo.with({
				-- 	-- milliseconds
				-- 	timeout = -1,
				-- }),
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							lsp_formatting(bufnr)
						end,
					})
				end
			end,
		})
	end,
}
