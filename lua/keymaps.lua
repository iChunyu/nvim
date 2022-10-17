local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map('', 'j', 'gj')
map('', 'k', 'gk')
map('', 'gj', 'j')
map('', 'gk', 'k')
map('', 'J', '5gj')
map('', 'K', '5gk')
map('n', '0', 'g0')
map('n', '$', 'g$')
map('n', 'g0', '0')
map('n', 'g$', '$')

map('n', '<leader>q', '<cmd>q<CR>')
map('n', '<leader>Q', '<cmd>q!<CR>')
map('n', '<leader>w', '<cmd>w<CR>')
map('n', '<leader>W', '<cmd>wq<CR>')

-- Centering search result
map('n', '=', 'nzz')
map('n', '-', 'Nzz')
map('n', '<leader><CR>', '<cmd>nohlsearch<CR>', { silent = true })

-- Split the screen and resize
map('n', 's', '')
map('n', 'sl', '<cmd>set splitright<CR><cmd>vsplit<CR>')
map('n', 'sh', '<cmd>set nosplitright<CR><cmd>vsplit<CR>')
map('n', 'sj', '<cmd>set splitbelow<CR><cmd>split<CR>')
map('n', 'sk', '<cmd>set nosplitbelow<CR><cmd>split<CR>')
map('n', '<leader>l', '<c-w>l')
map('n', '<leader>h', '<c-w>h')
map('n', '<leader>j', '<c-w>j')
map('n', '<leader>k', '<c-w>k')
map('n', '<leader>L', '<c-w>L')
map('n', '<leader>H', '<c-w>H')
map('n', '<leader>J', '<c-w>J')
map('n', '<leader>K', '<c-w>K')
map('n', '<up>', '<cmd>res +5<CR>')
map('n', '<down>', '<cmd>res -5<CR>')
map('n', '<left>', '<cmd>vertical res -5<CR>')
map('n', '<right>', '<cmd>vertical res +5<CR>')

map('n', 'Ta', '<cmd>tabe<CR>')
map('n', 'Th', '<cmd>-tabnext<CR>')
map('n', 'Tl', '<cmd>+tabnext<CR>')

map('n', '<leader>o', 'o<Esc>k')
map('n', '<leader>O', 'O<Esc>j')
map({ 'n', 'v' }, 'Y', '"+y')
map('n', '<c-l>', '1z=')

-- Formatting
map('n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<CR>', { silent = true })
