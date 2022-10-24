-- local map = vim.keymap.set
local cmd = require('command_center')

------------------------------------------
-- comment
------------------------------------------
require('Comment').setup {
    toggler = {
        ---Line-comment toggle keymap
        line = '<c-_>'
    },
    opleader = {
        ---Line-comment toggle keymap
        line = '<c-_>'
    },
}


------------------------------------------
-- autopairs
------------------------------------------
require("nvim-autopairs").setup({
    disable_filetype = { 'tex', 'markdown' }
})


------------------------------------------
-- bullets
------------------------------------------
vim.g['bullets_enabled_file_types'] = { 'markdown', 'text', 'gitcommit' }


------------------------------------------
-- tabular
------------------------------------------
-- map('v', '<leader>a', ':Tabular /')
cmd.add({
    {
        desc = 'Align text',
        cmd = ':Tabular /',
        keys = { 'v', '<leader>a' },
        category = 'tabular'
    }
})


------------------------------------------
-- renamer.nvim
------------------------------------------
require('renamer').setup {}
-- map('', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { silent = true })
cmd.add({
    {
        desc = 'Rename variables',
        cmd = '<cmd>lua require("renamer").rename()<cr>',
        keys = { 'n', '<F2>', { silent = true } },
        category = 'renamer'
    }
})


------------------------------------------
-- registers.nvim
------------------------------------------
require('registers').setup {
    window = {
        max_width = 100,
        highlight_cursorline = true,
        border = 'rounded',
        transparency = 0,
    },
}


------------------------------------------
-- nvim-surround
------------------------------------------
require("nvim-surround").setup {}
