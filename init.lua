require "bira.settings"
require "bira.plugins-setup"
require "bira.keymap"
-- in order for plugin keymaps to take precedence, plugins need to be required after keymaps
require "bira.plugins"
require "bira.lsp"

-- Enable Comment.nvim
require('Comment').setup()

