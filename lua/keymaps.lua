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

map('n', '<leader>q', ':q<CR>')
map('n', '<leader>Q', ':q!<CR>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>W', ':wq<CR>')

-- Centering search result
map('n', '=', 'nzz')
map('n', '-', 'Nzz')
map('n', '<leader><CR>', ':nohlsearch<CR>', { silent = true })

-- Split the screen and resize
map('n', 's', '')
map('n', 'sl', ':set splitright<CR>:vsplit<CR>')
map('n', 'sh', ':set nosplitright<CR>:vsplit<CR>')
map('n', 'sj', ':set splitbelow<CR>:split<CR>')
map('n', 'sk', ':set nosplitbelow<CR>:split<CR>')
map('n', '<leader>l', '<c-w>l')
map('n', '<leader>h', '<c-w>h')
map('n', '<leader>j', '<c-w>j')
map('n', '<leader>k', '<c-w>k')
map('n', '<leader>L', '<c-w>L')
map('n', '<leader>H', '<c-w>H')
map('n', '<leader>J', '<c-w>J')
map('n', '<leader>K', '<c-w>K')
map('n', '<up>', ':res +5<CR>')
map('n', '<down>', ':res -5<CR>')
map('n', '<left>', ':vertical res -5<CR>')
map('n', '<right>', ':vertical res +5<CR>')

map('n', 'Ta', ':tabe<CR>')
map('n', 'Th', ':-tabnext<CR>')
map('n', 'Tl', ':+tabnext<CR>')

map('n', '<leader>o', 'o<Esc>k')
map('n', '<leader>O', 'O<Esc>j')
map({ 'n', 'v' }, 'Y', '"+y')
map('n', '<c-l>', '1z=')

-- Formatting
map('n', '<leader>F', ':lua vim.lsp.buf.format()<CR>', { silent = true })
