local map = vim.keymap.set

-- Undotree: history tree like a local git
map('n', '<leader>u', ':UndotreeToggle<CR>')

-- Sniprun: run selected code
require('sniprun').setup({
    display = {"NvimNotify"},
})
map('', '<F9>', '<Plug>SnipRun')
