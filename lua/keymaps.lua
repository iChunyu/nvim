local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Movement
map('', 'j', 'gj')
map('', 'k', 'gk')
map('', 'gj', 'j')
map('', 'gk', 'k')
map('', 'J', '10gj')
map('', 'K', '10gk')
map('n', '0', 'g0')
map('n', '$', 'g$')
map('n', 'g0', '0')
map('n', 'g$', '$')

-- Centering search result
map('n', '=', 'nzz', { desc = 'find next and center window' })
map('n', '-', 'Nzz', { desc = 'find previous and center window' })
map('n', '<leader><CR>', '<cmd>nohlsearch<CR>', { silent = true, desc = 'stop highlighing search results' })

-- Split the screen and resize
map('n', '<leader>sl', '<cmd>set splitright<CR><cmd>vsplit<CR>', { desc = 'Split window to the right' })
map('n', '<leader>sh', '<cmd>set nosplitright<CR><cmd>vsplit<CR>', { desc = 'split window to the left' })
map('n', '<leader>sj', '<cmd>set splitbelow<CR><cmd>split<CR>', { desc = 'split window to the upper' })
map('n', '<leader>sk', '<cmd>set nosplitbelow<CR><cmd>split<CR>', { desc = 'split window to the lower' })
map('n', '<leader>l', '<c-w>l', { desc = 'goto the right window' })
map('n', '<leader>h', '<c-w>h', { desc = 'goto the left window' })
map('n', '<leader>j', '<c-w>j', { desc = 'goto the lower window' })
map('n', '<leader>k', '<c-w>k', { desc = 'goto the upper window' })
map('n', '<leader>L', '<c-w>L', { desc = 'move the window to right' })
map('n', '<leader>H', '<c-w>H', { desc = 'move the window to left' })
map('n', '<leader>J', '<c-w>J', { desc = 'move the window to lower' })
map('n', '<leader>K', '<c-w>K', { desc = 'move the window to upper' })
map('n', '<c-up>', '<cmd>res +5<CR>', { desc = 'increase window height' })
map('n', '<c-down>', '<cmd>res -5<CR>', { desc = 'decrease window height' })
map('n', '<c-right>', '<cmd>vertical res +5<CR>', { desc = 'inrease window width' })
map('n', '<c-left>', '<cmd>vertical res -5<CR>', { desc = 'decrease window width' })

-- Move Lines
map("n", "<a-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "move down" })
map("n", "<a-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "move up" })
map("i", "<a-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move down" })
map("i", "<a-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move up" })
map("v", "<a-j>", ":<c-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "move down" })
map("v", "<a-k>", ":<c-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "move up" })

-- Common-used commands
map('n', '<leader>q', '<cmd>q<CR>', { desc = 'quit' })
map('n', '<leader>Q', '<cmd>q!<CR>', { desc = 'quit without saving' })
map('n', '<leader>w', '<cmd>w<CR>', { desc = 'save file' })
map('n', '<leader>o', 'o<Esc>k', { desc = 'insert upper newline' })
map('n', '<leader>O', 'O<Esc>j', { desc = 'insert lower newline' })
map({ 'n', 'v' }, 'Y', '"+y', { desc = 'copy to the system clipboard' })

-- Formatting
map({ 'n', 'v' }, '<leader>F', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', { silent = true, desc = 'format file' })
