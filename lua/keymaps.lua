local map = vim.keymap.set

vim.g.mapleader = ' '

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

map('', '<leader>q', ':q<CR>')
map('', '<leader>Q', ':q!<CR>')
map('', '<leader>w', ':w<CR>')
map('', '<leader>W', ':wq<CR>')

-- not working
-- map('', 'R', ':source $MYVIMRC<CR>')

-- Centering search result
map('', '=', 'nzz')
map('', '-', 'Nzz')
map('', '<leader><CR>', ':nohlsearch<CR>', { silent = true })

-- Split the screen and resize
map('', 's', '')
map('', 'sl', ':set splitright<CR>:vsplit<CR>')
map('', 'sh', ':set nosplitright<CR>:vsplit<CR>')
map('', 'sj', ':set splitbelow<CR>:split<CR>')
map('', 'sk', ':set nosplitbelow<CR>:split<CR>')
map('', '<leader>l', '<c-w>l')
map('', '<leader>h', '<c-w>h')
map('', '<leader>j', '<c-w>j')
map('', '<leader>k', '<c-w>k')
map('', '<leader>L', '<c-w>L')
map('', '<leader>H', '<c-w>H')
map('', '<leader>J', '<c-w>J')
map('', '<leader>K', '<c-w>K')
map('', '<up>', ':res +5<CR>')
map('', '<down>', ':res -5<CR>')
map('', '<left>', ':vertical res -5<CR>')
map('', '<right>', ':vertical res +5<CR>')

map('', 'ta', ':tabe<CR>')
map('', 'th', ':-tabnext<CR>')
map('', 'tl', ':+tabnext<CR>')

map('', '<leader>o', 'o<Esc>k')
map('', '<leader>O', 'O<Esc>j')
map('', 'Y', '"+y')
map('', '<c-l>', '1z=')

-- Formatting
map('n', '<leader>f', ':lua vim.lsp.buf.formatting()<CR>', { silent = true })
map('v', '<leader>f', ':lua vim.lsp.buf.range_formatting()<CR>', { silent = true })
