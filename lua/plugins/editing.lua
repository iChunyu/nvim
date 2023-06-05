local map = vim.keymap.set

return {
    -- Switch and restore fcitx state for each buffer
    "h-hg/fcitx.nvim",

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
    { 'windwp/nvim-autopairs', opts = { disable_filetype = { 'tex', 'markdown' } } },

    -- Text filtering and alignment
    {
        'godlygeek/tabular',
        config = function()
            map('v', '<leader>a', ':Tabular /')
        end
    },

    -- Neovim plugin to preview the contents of the registers
    {
        "tversteeg/registers.nvim",
        name = "registers",
        opts = {
            window = {
                max_width = 100,
                highlight_cursorline = true,
                border = 'rounded',
                transparency = 0,
            }
        },
        keys = {
            { "\"",    mode = { "n", "v" } },
            { "<C-R>", mode = "i" }
        },
        cmd = "Registers",
    },

    -- Surround selections
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = true
    }

}
