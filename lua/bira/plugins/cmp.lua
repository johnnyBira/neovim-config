return {
	"hrsh7th/nvim-cmp",
	dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	event = "InsertEnter",
	config = function(arts)
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
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
				-- ['<Tab>'] = cmp.mapping(function(fallback)
				--   if cmp.visible() then
				--     cmp.select_next_item()
				--   elseif luasnip.expand_or_jumpable() then
				--     luasnip.expand_or_jump()
				--   else
				--     fallback()
				--   end
				-- end, { 'i', 's' }),
				-- ['<S-Tab>'] = cmp.mapping(function(fallback)
				--   if cmp.visible() then
				--     cmp.select_prev_item()
				--   elseif luasnip.jumpable(-1) then
				--     luasnip.jump(-1)
				--   else
				--     fallback()
				--   end
				-- end, { 'i', 's' }),
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
