-- Keymaps for better default experience See `:help vim.keymap.set()` vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true }) Diagnostic keymaps vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>")
vim.g.copilot_assume_mapped = true

-- scale splits using control-shift-hjkl
vim.keymap.set("n", "<c-s-h>", ":vertical-resize -5 <cr>")
vim.keymap.set("n", "<c-s-j>", ":horizontal-resize -5 <cr>")
vim.keymap.set("n", "<C-S-k>", ":horizontal-resize +5 <cr>")
vim.keymap.set("n", "<C-S-l>", ":vertical-resize +5 <cr>")

-- redo using control-shift-u
vim.keymap.set("n", "U", "<C-r>")

-- move selected lines up and down using shift-j/k
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv")

-- jump betwen buffers using shift-h/l
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Jump to previous buffer", silent = true })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Jump to next buffer", silent = true })

-- navigate to right and left split using contorl-h/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to left split", silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to right split", silent = true })
-- navigate to top and bottom split using contorl-h/l
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate to top split", silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate to bottom split", silent = true })

-- close buffer with shift-u
vim.keymap.set("n", "<S-u>", ":bdelete<CR>")

-- open horizontal split
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Open horizontal split" })
-- open vertical split
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Open vertical split" })

-- cloe current split window with leader + u
vim.keymap.set("n", "<leader>q", ":q <CR>", { desc = "Close current split window", silent = true })
-- force close current split window with leader + u
vim.keymap.set("n", "<leader>Q", ":q! <CR>", { desc = "Force close current split window", silent = true })
vim.keymap.set("n", "<s-q>", ":bp | bd # <CR>", { desc = "Close current buffer", silent = true })

-- center page after page up/down
vim.keymap.set("n", "<C-d>", "<C-d> | zz", { desc = "Center page after page down" })
vim.keymap.set("n", "<C-u>", "<C-u> | zz", { desc = "Center page after page up" })

-- cener page after paragraph up/down
vim.keymap.set("n", "}", "}zz", { desc = "Center page after paragraph down" })
vim.keymap.set("n", "{", "{zz", { desc = "Center page after paragraph up" })

-- cener page after go to next/previous jump point
vim.keymap.set("n", "<C-o>", "<C-o> | zz", { desc = "Center page after go to next jump point" })
vim.keymap.set("n", "<C-i>", "<C-i> | zz", { desc = "Center page after go to previous jump point" })

-- center page after search with n/N
vim.keymap.set("n", "n", "nzzzv", { desc = "Center page after search with n" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center page after search with N" })

-- center page after jumping to button of file with G
vim.keymap.set("n", "G", "Gzzzv", { desc = "Center page after jumping to button of file with G" })

-- indent using using < and r on selected lines in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Unindent selected lines in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent selected lines in visual mode" })

-- save using control + s
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })

-- delete without adding to register
vim.keymap.set({ "n", "v" }, "d", '"_d', { silent = true })
vim.keymap.set({ "n", "v" }, "D", '"_D')
vim.keymap.set({ "n", "v" }, "<leader>d", "d")
vim.keymap.set({ "n", "v" }, "<leader>D", "D")

-- change without adding to register
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set({ "n", "v" }, "C", '"_C')
vim.keymap.set({ "n", "v" }, "<leader>c", "c")
vim.keymap.set({ "n", "v" }, "<leader>C", "C")

-- past over selected without adding to register
vim.keymap.set("v", "p", '"_dP')
vim.keymap.set("v", "P", '"_dP')
vim.keymap.set("v", "<leader>p", "p")
vim.keymap.set("v", "<leader>P", "P")

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>y", "y")
vim.keymap.set({ "n", "v" }, "Y", '"+y$')
vim.keymap.set({ "n", "v" }, "<leader>Y", "Y")

-- prevent x from adding to register
vim.keymap.set("n", "x", '"_x')

-- prevent accidental closing of nvim
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- replace all occurences of word under cursor with new word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- open link under cursor in browser
vim.keymap.set("n", "<leader>o", ":silent !open <cWORD><CR>")

-- open diagonistics in a floating window with leader + j
-- vim.keymap.set("n", "<leader>j", ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>', { silent = true })
-- vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover)

-- keymap for opening lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")

-- wrap selected text with console.log()
vim.keymap.set("v", "<leader>l", [[:s/^/console.log(/<CR>:s/$/);<CR>]])

vim.keymap.set({ "n", "v" }, "<S-w>", "$", { desc = "Move to end of line" })
vim.keymap.set({ "n", "v" }, "<S-b>", "0", { desc = "Move to start of line" })

vim.keymap.set({ "n", "v" }, "<S-u>", "<C-r>", { desc = "Redo" })
