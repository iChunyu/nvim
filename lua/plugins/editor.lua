return
{
    -- Switch and restore fcitx state for each buffer
    "h-hg/fcitx.nvim",

    -- VS Code-like renaming UI
    {
        'filipdutescu/renamer.nvim',
        opts = {},
        keys = {
            { '<F2>', '<cmd>lua require("renamer").rename()<cr>', '', { silent = true } }
        }
    },

    -- Smart and powerful comment plugin for neovim
    {
        'numToStr/Comment.nvim',
        opts = {
            toggler = {
                -- Line-comment toggle keymap
                line = '<c-_>',
                block = '<a-a>'
            },
            opleader = {
                -- Line-comment toggle keymap
                line = '<c-_>',
                block = '<a-a>'
            }
        }
    },

    -- Autopairs for neovim
    { 'windwp/nvim-autopairs', opts = { disable_filetype = { 'tex', 'markdown' } } },

    -- Text filtering and alignment
    {
        'godlygeek/tabular',
        lazy = false,
        keys = {
            { '<leader>a', 'v', ':Tabularize /' }
        }
    },

    -- Surround selections
    {
        'kylechui/nvim-surround',
        version = "*",
        event = "VeryLazy",
        config = true
    },

    -- Git integration
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

    -- Fast navigation
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    }
}
