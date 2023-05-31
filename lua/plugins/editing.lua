local map = vim.keymap.set

return {
    -- Switch and restore fcitx state for each buffer
    'h-hg/fcitx.nvim',

    -- Smart and powerful comment plugin for neovim
    {
        'numToStr/Comment.nvim',
        opts = {
            toggler = {
                -- Line-comment toggle keymap
                line = '<c-_>'
            },
            opleader = {
                -- Line-comment toggle keymap
                line = '<c-_>'
            }
        }
    },

    -- Autopairs for neovim
    { 'windwp/nvim-autopairs', disable_filetype = { 'tex', 'markdown' } },

    -- Text filtering and alignment
    {
        'godlygeek/tabular',
        config = function()
            map('v', '<leader>a', ':Tabular /')
        end
    },

}
