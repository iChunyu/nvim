local map = vim.keymap.set

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
map('v', '<leader>ta', ':Tabular /')


------------------------------------------
-- renamer.nvim
------------------------------------------
require('renamer').setup {}
map('', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { silent = true })
