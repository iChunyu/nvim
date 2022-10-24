local map = vim.keymap.set
local cmd = require('command_center')

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
-- map('n', 'sl', '<cmd>set splitright<CR><cmd>vsplit<CR>')
-- map('n', 'sh', '<cmd>set nosplitright<CR><cmd>vsplit<CR>')
-- map('n', 'sj', '<cmd>set splitbelow<CR><cmd>split<CR>')
-- map('n', 'sk', '<cmd>set nosplitbelow<CR><cmd>split<CR>')
-- map('n', '<leader>l', '<c-w>l')
-- map('n', '<leader>h', '<c-w>h')
-- map('n', '<leader>j', '<c-w>j')
-- map('n', '<leader>k', '<c-w>k')
-- map('n', '<leader>L', '<c-w>L')
-- map('n', '<leader>H', '<c-w>H')
-- map('n', '<leader>J', '<c-w>J')
-- map('n', '<leader>K', '<c-w>K')
-- map('n', '<up>', '<cmd>res +5<CR>')
-- map('n', '<down>', '<cmd>res -5<CR>')
-- map('n', '<left>', '<cmd>vertical res -5<CR>')
-- map('n', '<right>', '<cmd>vertical res +5<CR>')
cmd.add({
    {
        desc = 'Split window to the right',
        cmd = '<cmd>set splitright<cr><cmd>vsplit<cr>',
        keys = { 'n', 'sl' },
        category = 'core'
    }, {
        desc = 'Split window to the left',
        cmd = '<cmd>set nosplitright<cr><cmd>vsplit<cr>',
        keys = { 'n', 'sh' },
        category = 'core'
    }, {
        desc = 'Split window to the below',
        cmd = '<cmd>set splitbelow<cr><cmd>split<cr>',
        keys = { 'n', 'sj' },
        category = 'core'
    }, {
        desc = 'Split window to the up',
        cmd = '<cmd>set nosplitbelow<cr><cmd>split<cr>',
        keys = { 'n', 'sk' },
        category = 'core'
    }, {
        desc = 'Switch to the right window',
        cmd = '<c-w>l',
        keys = { 'n', '<leader>l' },
        category = 'core'
    }, {
        desc = 'Switch to the left window',
        cmd = '<c-w>h',
        keys = { 'n', '<leader>h' },
        category = 'core'
    }, {
        desc = 'Switch to the below window',
        cmd = '<c-w>j',
        keys = { 'n', '<leader>j' },
        category = 'core'
    }, {
        desc = 'Switch to the up window',
        cmd = '<c-w>k',
        keys = { 'n', '<leader>k' },
        category = 'core'
    }, {
        desc = 'Move to the right',
        cmd = '<c-w>L',
        keys = { 'n', '<leader>L' },
        category = 'core'
    }, {
        desc = 'Move to the left',
        cmd = '<c-w>H',
        keys = { 'n', '<leader>H' },
        category = 'core'
    }, {
        desc = 'Move to the below',
        cmd = '<c-w>J',
        keys = { 'n', '<leader>J' },
        category = 'core'
    }, {
        desc = 'Moe to the up',
        cmd = '<c-w>K',
        keys = { 'n', '<leader>K' },
        category = 'core'
    }, {
        desc = 'Increase window height',
        cmd = '<cmd>res +5<cr>',
        keys = { 'n', '<up>' },
        category = 'core'
    }, {
        desc = 'Decrease window height',
        cmd = '<cmd>res -5<cr>',
        keys = { 'n', '<down>' },
        category = 'core'
    }, {
        desc = 'Increase window width',
        cmd = '<cmd>vertical res +5<cr>',
        keys = { 'n', '<right>' },
        category = 'core'
    }, {
        desc = 'Decrease window window',
        cmd = '<cmd>vertical res -5<cr>',
        keys = { 'n', '<left>' },
        category = 'core'
    }
})


-- map('n', 'Ta', '<cmd>tabe<CR>')
-- map('n', 'Th', '<cmd>-tabnext<CR>')
-- map('n', 'Tl', '<cmd>+tabnext<CR>')
cmd.add({
    {
        desc = 'Open new tab',
        cmd = '<cmd>tabe<cr>',
        keys = { 'n', 'Ta' },
        category = 'core'
    }, {
        desc = 'Jump to the right tab',
        cmd = '<cmd>+tabnext<cr>',
        keys = { 'n', 'Tl' },
        category = 'core'
    }, {
        desc = 'Jump to the left tab',
        cmd = '<cmd>-tabnext<cr>',
        keys = { 'n', 'Th' },
        category = 'core'
    }
})


map('n', '<leader>o', 'o<Esc>k')
map('n', '<leader>O', 'O<Esc>j')
map({ 'n', 'v' }, 'Y', '"+y')
-- map('n', '<c-l>', '1z=')
cmd.add({
    {
        desc = 'Correct spelling',
        cmd = '1z=',
        keys = { 'n', '<c-l>' },
        category = 'core'
    }
})


-- Formatting
-- map('n', '<leader>F', '<cmd>lua vim.lsp.buf.format()<CR>', { silent = true })
cmd.add({
    {
        desc = 'Format code',
        cmd = '<cmd>lua vim.lsp.buf.format()<cr>',
        keys = { 'n', '<leader>F', { silent = true } },
        category = 'lsp'
    }
})
