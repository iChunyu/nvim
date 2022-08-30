------------------------------------------
-- nightfox
------------------------------------------
vim.cmd('colorscheme nordfox')


------------------------------------------
-- lualine
------------------------------------------
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
    }
}

------------------------------------------
-- nvim-notify
------------------------------------------
vim.notify = require("notify")


------------------------------------------
-- nvim-colorizer
------------------------------------------
require 'colorizer'.setup()


------------------------------------------
-- marks.nvim
------------------------------------------
require('marks').setup()


------------------------------------------
-- indent-blankline.nvim
------------------------------------------
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
-- vim.opt.listchars:append "space:⋅" -- Show spaces as virtual dot
-- vim.opt.listchars:append "eol:↴" -- Show end of line

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}


------------------------------------------
-- nvim-cursorline
------------------------------------------
require('nvim-cursorline').setup {
    cursorline = {
        enable = true,
        timeout = 0,
        number = true,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    }
}
