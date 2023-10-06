local map = vim.keymap.set

return {
    'nvim-tree/nvim-web-devicons', -- Icons and colors for each icon
    'MunifTanjim/nui.nvim',        -- UI Component Library for Neovim
    'rcarriga/nvim-notify',        -- A fancy, configurable, notification manager

    -- Colorscheme
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = function()
            vim.cmd [[colorscheme tokyonight]]
        end
    },

    -- Beautiful UI
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = { lsp_progress = { enabled = false } }
    },

    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
            },
            sections = {
                lualine_x = { {
                    require("noice").api.status.mode.get,
                    cond = require("noice").api.status.mode.has,
                    color = { fg = '#ff9e64' },
                }, 'encoding', 'filetype' }
            }
        }
    },

    -- Color highlighter
    { 'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end },

    -- View and interact with Vim marks
    { 'chentoast/marks.nvim',        config = true },

    -- Indent guides for Neovim
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        config = function()
            local highlight = {
                "RainbowRed",
                "RainbowYellow",
                "RainbowBlue",
                "RainbowOrange",
                "RainbowGreen",
                "RainbowViolet",
                "RainbowCyan",
            }

            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)
            require("ibl").setup { indent = { highlight = highlight } }
        end
    },

    -- Highlight, list and search todo comments
    { 'folke/todo-comments.nvim',  config = true },

    -- VS Code-like renaming UI
    {
        'filipdutescu/renamer.nvim',
        config = function()
            map('', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { silent = true })
        end
    },

    -- Decorate scrollbar for Neovim
    -- { 'lewis6991/satellite.nvim', config = true }
    { 'petertriho/nvim-scrollbar', config = true }

}
