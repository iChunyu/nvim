-- bullets: enable following filetype
vim.g['bullets_enabled_file_types'] = { 'markdown', 'text', 'gitcommit' }


-- tabular: keymap
local map = vim.keymap.set
map('v', '<leader>ta', ':Tabular /')
