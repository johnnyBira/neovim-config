require "bira.settings"
require "bira.plugins-setup"
require "bira.plugins"
require "bira.keymap"
require "bira.lsp"

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}
