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
        config = function()
            vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
            vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
            vim.opt.list = true
            -- vim.opt.listchars:append 'space:⋅' -- Show spaces as virtual dot
            -- vim.opt.listchars:append 'eol:↴' -- Show end of line
            require('indent_blankline').setup {
                space_char_blankline = ' ',
                char_highlight_list = {
                    'IndentBlanklineIndent1',
                    'IndentBlanklineIndent2',
                    'IndentBlanklineIndent3',
                    'IndentBlanklineIndent4',
                    'IndentBlanklineIndent5',
                    'IndentBlanklineIndent6',
                },
            }
        end
    },

    -- Highlight, list and search todo comments
    { 'folke/todo-comments.nvim', config = true },

    -- VS Code-like renaming UI
    {
        'filipdutescu/renamer.nvim',
        config = function()
            map('', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { silent = true })
        end
    },

    -- Decorate scrollbar for Neovim
    { 'lewis6991/satellite.nvim', config = true }

}
