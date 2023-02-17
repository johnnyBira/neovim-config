local ok, lualine = pcall(require, "lualine")

if not ok then
  return
end

-- Set lualine as statusline
-- See `:help lualine.txt`
lualine.setup {
  options = {
    theme = 'nord',
    component_separators = '|',
    section_separators = '',
    git_branch_icon = '',
  },
}

