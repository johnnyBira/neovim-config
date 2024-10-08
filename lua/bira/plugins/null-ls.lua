return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		-- Al lot of builtins were removed from null-ls as part of this PR:
		-- https://github.com/nvimtools/none-ls.nvim/discussions/81
		-- Some of them were moved to none-ls-extras.nvim
		-- https://github.com/nvimtools/none-ls-extras.nvim/tree/main?tab=readme-ov-file
		"nvimtools/none-ls-extras.nvim",
		-- this adds back the builltin shellcheck that was removed from null-ls
		"gbprod/none-ls-shellcheck.nvim",
	},
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
			timeout_ms = 5000,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.diagnostics.gdlint,
				null_ls.builtins.formatting.gdformat,
				require("none-ls.diagnostics.eslint_d"),
				require("none-ls.formatting.eslint_d"),
				require("none-ls.code_actions.eslint_d"),
				require("none-ls-shellcheck.diagnostics"),
				require("none-ls-shellcheck.code_actions"),
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
