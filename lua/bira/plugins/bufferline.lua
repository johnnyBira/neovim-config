local bufferline = require("bufferline")

bufferline.setup({
	options = {
		offsets = {
			{
				filetype = "NvimTree",
				highlight = "Directory",
				separator = true, -- use a "true" to enable the default, or set your own character
			},
		},
	},
})
