return
{
    -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        opts = {},
        keys = {
            {'<leader>e', '<cmd>NvimTreeToggle<CR>', '', { silent = true }}
        }
    },

    -- Find, Filter, Preview, Pick
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        version = '*',
        keys = {
            {'<leader>ff', '<cmd>Telescope find_files<cr>'},
            {'<leader>fg', '<cmd>Telescope live_grep<cr>'},
            {'<leader>fb', '<cmd>Telescope buffers<cr>'},
            {'<leader>fh', '<cmd>Telescope help_tags<cr>'}
        }
    },
}
