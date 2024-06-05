return {
	"folke/flash.nvim",
	event = "BufRead", -- Optional lazy loading with `ft` event
	---@type Flash.Config
	opts = {},
  -- stylua: ignore
  keys = {
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
