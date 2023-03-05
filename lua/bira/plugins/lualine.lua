local ok, lualine = pcall(require, "lualine")

if not ok then
  return
end

-- Set lualine as statusline
-- See `:help lualine.txt`
lualine.setup {
  options = {
    theme = 'duskfox',
    component_separators = '|',
    section_separators = '',
    path = 1
  },
}

