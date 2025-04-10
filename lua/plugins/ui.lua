return
{
    'MunifTanjim/nui.nvim',        -- UI Component Library for Neovim
    'rcarriga/nvim-notify',        -- A fancy, configurable, notification manager
    'nvim-tree/nvim-web-devicons', -- Icons and colors for each icon
    'nvim-lua/plenary.nvim',       -- utils functions

    -- Beautiful UI
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- lsp = { progress = { enabled = false } }
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
            "nvim-treesitter/nvim-treesitter",
        }
    },

    -- Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = function() vim.cmd [[colorscheme tokyonight]] end,
    },

    -- Statusline
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            "folke/noice.nvim",
        },
        opts = {
            sections = {
                lualine_x = { {
                    require("noice").api.status.mode.get,
                    cond = require("noice").api.status.mode.has,
                    color = { fg = '#ff9e64' },
                }, 'encoding', 'fileformat', 'filetype' }
            }
        },
    },

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
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)
            require("ibl").setup {
                indent = { highlight = highlight },
                scope = { enabled = false, },
            }
        end
    },

    -- Colorizer
    {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end,
    },

    -- View and interact with Vim marks
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },

    -- Highlight, list and search todo comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },

    -- Decorate scrollbar
    { 'petertriho/nvim-scrollbar', opts = {} },

    -- Snazzy bufferline
    {
        'akinsho/bufferline.nvim',
        version = "*",
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'moll/vim-bbye' -- delete buffer
        },
        opts = {
            options = {
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or " ")
                        s = s .. n .. sym
                    end
                    return s
                end,
                always_show_bufferline = false,
            }
        },
        keys = {
            { 'tt', '<cmd>BufferLinePick<CR>',      '', { silent = true } },
            { 'th', '<cmd>BufferLineCyclePrev<CR>', '', { silent = true } },
            { 'tl', '<cmd>BufferLineCycleNext<CR>', '', { silent = true } },
            { 'tq', '<cmd>BufferLinePickClose<CR>', '', { silent = true } },
            { 'td', '<cmd>Bdelete<CR>',             '', { silent = true } },
        }
    },

    -- {
    --     "folke/trouble.nvim",
    --     opts = {}, -- for default options, refer to the configuration section for custom setup.
    --     cmd = "Trouble",
    --     keys = {
    --         { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)", },
    --         { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer Diagnostics (Trouble)", },
    --         { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols (Trouble)", },
    --         { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
    --         { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                            desc = "Location List (Trouble)", },
    --         { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix List (Trouble)", },
    --     },
    -- },

    -- Treesitter
    {
        'nvim-treesitter',
        main = 'nvim-treesitter.configs',
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "lua", "vim", "vimdoc", "python", "c", "markdown", "markdown_inline" },
            sync_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
    },

    -- Outline
    {
        "hedyhli/outline.nvim",
        keys = {
            { "<leader>r", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
            -- outline_window = {
            --     auto_close = true,
            -- },
        },
    },
}
