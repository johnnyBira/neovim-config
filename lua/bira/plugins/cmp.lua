return {
	"hrsh7th/nvim-cmp",
	dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	event = "InsertEnter",
	config = function(arts)
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		---@diagnostic disable-next-line missing-fields
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			---@diagnostic disable-next-line missing-fields
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				-- open completion menu
				["<C-Space>"] = cmp.mapping.complete(
					-- in normal mode, open completion menu
					{ behavior = cmp.ConfirmBehavior.Insert, select = true }
				),
				-- close completion menu
				["<C-e>"] = cmp.mapping.close(),
				-- navigate through completion menu
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				-- import path completion
				{ name = "path" },
			},
			window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered(),
			},
		})
	end,
}
