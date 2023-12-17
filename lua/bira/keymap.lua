-- Keymaps for better default experience See `:help vim.keymap.set(, { silent = true })` vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true }, { silent = true }) Diagnostic keymaps vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { silent = true })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { silent = true })

vim.g.copilot_assume_mapped = true

-- scale splits using control-shift-h/j/k/l
local incrementBy = 10
vim.keymap.set("n", "<c-s-h>", ":vertical resize -" .. incrementBy .. " <cr>", { silent = true })
vim.keymap.set("n", "<c-s-j>", ":horizonta resize -" .. incrementBy .. "<cr>", { silent = true })
vim.keymap.set("n", "<C-S-k>", ":horizontal resize +" .. incrementBy .. "<cr>", { silent = true })
vim.keymap.set("n", "<C-S-l>", ":vertical resize +" .. incrementBy .. "<cr>", { silent = true })

-- redo using control-shift-u
vim.keymap.set("n", "U", "<C-r>", { silent = true })

-- move selected lines up and down using shift-j/k
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { silent = true })

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
vim.keymap.set("n", "<S-u>", ":bdelete<CR>", { silent = true })

-- open horizontal split
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Open horizontal split", silent = true })
-- open vertical split
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Open vertical split", silent = true })

-- cloe current split window with leader + u
vim.keymap.set("n", "<leader>q", ":q <CR>", { desc = "Close current split window", silent = true })
-- force close current split window with leader + u
vim.keymap.set("n", "<leader>Q", ":q! <CR>", { desc = "Force close current split window", silent = true })
vim.keymap.set("n", "<s-q>", ":bp | bd # <CR>", { desc = "Close current buffer", silent = true })

-- center page after page up/down
vim.keymap.set("n", "<C-d>", "<C-d> | zz", { desc = "Center page after page down", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u> | zz", { desc = "Center page after page up", silent = true })

-- cener page after paragraph up/down
vim.keymap.set("n", "}", "}zz", { desc = "Center page after paragraph down", silent = true })
vim.keymap.set("n", "{", "{zz", { desc = "Center page after paragraph up", silent = true })

-- center page after search with n/N
vim.keymap.set("n", "n", "nzzzv", { desc = "Center page after search with n", silent = true })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center page after search with N", silent = true })

-- center page after jumping to button of file with G
vim.keymap.set("n", "G", "Gzzzv", { desc = "Center page after jumping to button of file with G", silent = true })

-- indent using using < and r on selected lines in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Unindent selected lines in visual mode", silent = true })
vim.keymap.set("v", ">", ">gv", { desc = "Indent selected lines in visual mode", silent = true })

-- save using control + s
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file", silent = true })

-- delete without adding to register
vim.keymap.set({ "n", "v" }, "d", '"_d', { silent = true })
vim.keymap.set({ "n", "v" }, "D", '"_D', { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>d", "d", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>D", "D", { silent = true })

-- change without adding to register
vim.keymap.set({ "n", "v" }, "c", '"_c', { silent = true })
vim.keymap.set({ "n", "v" }, "C", '"_C', { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>c", "c", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>C", "C", { silent = true })

-- past over selected without adding to register
vim.keymap.set("v", "p", '"_dP', { silent = true })
vim.keymap.set("v", "P", '"_dP', { silent = true })
vim.keymap.set("v", "<leader>p", "p", { silent = true })
vim.keymap.set("v", "<leader>P", "P", { silent = true })

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "y", '"+y', { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>y", "y", { silent = true })
vim.keymap.set({ "n", "v" }, "Y", '"+y$', { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>Y", "Y", { silent = true })

-- prevent x from adding to register
vim.keymap.set("n", "x", '"_x', { silent = true })

-- prevent accidental closing of nvim
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })

-- replace all occurences of word under cursor with new word
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = true })

-- open link under cursor in browser
vim.keymap.set("n", "<leader>o", ":silent !open <cWORD><CR>", { silent = true })

-- open diagonistics in a floating window with leader + j
-- vim.keymap.set("n", "<leader>j", ':lua vim.diagnostic.open_float(0, {scope="line"}, { silent = true })<CR>', { silent = true })
-- vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { silent = true })

-- keymap for opening lazygit
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })

-- wrap selected text with console.log()
vim.keymap.set("v", "<leader>l", [[:s/^/console.log(/<CR>:s/$/, { silent = true });<CR>]])

vim.keymap.set({ "n", "v" }, "<S-u>", "<C-r>", { desc = "Redo", silent = true })
