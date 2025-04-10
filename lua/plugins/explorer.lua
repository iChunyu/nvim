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

    -- Terminal integration
    {
        'akinsho/toggleterm.nvim',
        version = '*',
        config = function()
            require('toggleterm').setup({
                open_mapping = '<F4>',
                direction = 'float',
                float_opts = {
                    border = 'curved'
                }
            })
            vim.keymap.set('t', '<esc>', '<C-\\><C-n>')
            vim.keymap.set('n', '<leader>t', ':ToggleTermSendCurrentLine<CR>', { silent = true })
            vim.keymap.set('v', '<leader>t', ':ToggleTermSendVisualSelection<CR>', { silent = true })
        end
    },
}
