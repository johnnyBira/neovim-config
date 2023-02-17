-- empty setup using defaults
local ok, nvimtree = pcall(require, "nvim-tree")

if not nvimtree then
  print("no nvim-tree")
end

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        -- opens the current directory or file using lua's os.execute
        { key = "l", action = "<CR>" },
        { key = "h", action = "<CR>" },
        -- close all open directories
        { key = "q", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
