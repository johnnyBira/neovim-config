-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- current buffer fuzzy search
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- nvim tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle <cr>')
vim.keymap.set('n', '<leader>l', ':NvimTreeOpen <cr>')

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>")
vim.g.copilot_assume_mapped = true

-- jump between splits using control-hjkl
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- scale splits using control-shift-hjkl
vim.keymap.set('n', '<C-S-h>', ':vertical-resize -5 <cr>')
vim.keymap.set('n', '<C-S-j>', ':horizontal-resize -5 <cr>')
vim.keymap.set('n', '<C-S-k>', ':horizontal-resize +5 <cr>')
vim.keymap.set('n', '<C-S-l>', ':vertical-resize +5<CR>')

-- redo using control-shift-u
vim.keymap.set('n', '<C-S-u>', '<C-r>')

-- move selected lines up and down using shift-j/k
vim.keymap.set('v', '<S-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<S-k>', ":m '<-2<CR>gv=gv")

-- jump betwen buffers using shift-h/l
vim.keymap.set('n', '<S-h>', ':bprevious<CR>')
vim.keymap.set('n', '<S-l>', ':bnext<CR>')

-- close buffer with shift-u
vim.keymap.set('n', '<S-u>', ':bdelete<CR>')

-- open horizontal split
vim.keymap.set('n', '<leader>h', ':split<CR>', { desc = 'Open horizontal split' })
-- open vertical split
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = 'Open vertical split' })
-- cloe current split window with leader + u
vim.keymap.set('n', '<leader>u', ':q<CR>')
-- force close current split window with leader + U
vim.keymap.set('n', '<leader>U', ':q!<CR>')

-- center page after page up/down
vim.keymap.set('n', '<C-d>', '<C-d>|zz')
vim.keymap.set('n', '<C-u>', '<C-u>|zz')

-- center page after search with n/N
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- center page after jumping to button of file with G
vim.keymap.set('n', 'G', 'Gzzzv')

-- indent using using < and r on selected lines in visual mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- save using control + s
vim.keymap.set('n', '<C-s>', ':w<CR>')

-- delete without adding to register
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- yank to system clipboard
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")

-- paste over selected without adding to register
vim.keymap.set('x', '<leader>p', "\"_dP")

-- prevent x from adding to register
vim.keymap.set('n', 'x', '"_x')

-- prevent accidental closing of nvim
vim.keymap.set('n', '<leader>q', ':q<CR>')

-- replace all occurences of word under cursor with new word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- open link under cursor in browser
vim.keymap.set('n', '<leader>o', ':silent !open <cWORD><CR>')

-- open diagonistics in a floating window with leader + j
vim.keymap.set('n', '<leader>j', ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>')

-- keymap for opening lazygit
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>')

-- wrap selected text with console.log()
vim.api.nvim_buf_set_keymap(0, "v", ",cl", [[cconsole.log(<c-r>"<esc>]], { noremap = false })

