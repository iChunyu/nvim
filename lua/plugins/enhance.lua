local map = vim.keymap.set

return {
    -- All the lua functions the author doesn't want to write twice
    'nvim-lua/plenary.nvim',

    -- Git intergration
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local function gitmap(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    opts.silent = true
                    vim.keymap.set(mode, l, r, opts)
                end
                -- Keymap
                gitmap('', '<leader>gd', gs.preview_hunk)
                gitmap('', '<leader>gj', gs.next_hunk)
                gitmap('', '<leader>gk', gs.prev_hunk)
                gitmap('', '<leader>ga', gs.stage_hunk)
                gitmap('', '<leader>gA', gs.stage_buffer)
                gitmap('', '<leader>gu', gs.undo_stage_hunk)
                gitmap('', '<leader>gb', gs.toggle_current_line_blame)
                gitmap('', '<leader>gB', function() gs.blame_line { full = true } end)
            end
        }
    },

    -- General-purpose motion plugin
    {
        'ggandor/leap.nvim',
        config = function()
            map('', 'L', '<Plug>(leap-forward-to)')
            map('', 'H', '<Plug>(leap-backward-to)')
        end
    },

    -- The undo history visualizer
    {
        'mbbill/undotree',
        config = function()
            map('n', '<leader>u', '<cmd>UndotreeToggle<CR>')
        end
    },

    -- File explorer
    {
        'nvim-tree/nvim-tree.lua',
        config = function()
            require("nvim-tree").setup()
            map('', '<leader>e', '<cmd>NvimTreeToggle<CR>', { silent = true })
        end
    },

    -- A snazzy bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'moll/vim-bbye' }, -- Delete buffer
        version = "*",
        config = function()
            require("bufferline").setup {
                options = {
                    mode = 'buffers',
                    diagnostics = 'nvim_lsp',
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                    always_show_bufferline = false,
                }
            }
            map('', 'tt', '<cmd>BufferLinePick<CR>', { silent = true })
            map('', 'th', '<cmd>BufferLineCyclePrev<CR>', { silent = true })
            map('', 'tl', '<cmd>BufferLineCycleNext<CR>', { silent = true })
            map('', 'tq', '<cmd>BufferLinePickClose<CR>', { silent = true })
            map('', 'td', '<cmd>Bdelete<CR>', { silent = true })
        end
    },

    -- Find, Filter, Preview, Pick
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        config = function()
            map('', '<leader>ff', '<cmd>Telescope find_files<cr>')
            map('', '<leader>fg', '<cmd>Telescope live_grep<cr>')
            map('', '<leader>fb', '<cmd>Telescope buffers<cr>')
            map('', '<leader>fh', '<cmd>Telescope help_tags<cr>')
        end
    },

    -- Persist and toggle multiple terminals
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
            map('t', '<esc>', '<C-\\><C-n>')
            map('n', '<leader>r', ':ToggleTermSendCurrentLine<CR>', { silent = true })
            map('v', '<leader>r', ':ToggleTermSendVisualSelection<CR>', { silent = true })
        end
    },

    -- Single tabpage interface for easily cycling through diffs
    'sindrets/diffview.nvim',

    -- LSP diagnostics
    {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {}
            vim.keymap.set('n', '<leader>t', '<cmd>TroubleToggle<cr>')
        end
    },
}
