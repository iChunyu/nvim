------------------------------------------
-- treesitter
------------------------------------------
require('nvim-treesitter.configs').setup {
    -- one of "all", "language", or a list of languages
    -- Do NOT add 'latex' and 'markdown' for now, breaking `vimtex#syntax#in_mathzone`
    -- Ref: https://github.com/nvim-treesitter/nvim-treesitter/issues/1184
    ensure_installed = { 'bibtex', 'python', 'vim', 'lua', 'cpp' },
    highlight = {
        enable = true, -- false will disable the whole extension
    },
}

------------------------------------------
-- rainbow
------------------------------------------
vim.cmd [[
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': [ '#E06C75', '#E5C07B', '#98C379', '#56B6C2', '#61AFEF', '#C678DD' ],
    \   'separately': {
    \       '*':{
    \           'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \           'parentheses_options': 'containedin=ALL'
    \       },
    \       'tex':{
    \           'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold',
    \                           'start=/\\left\\*[(\[{.]/ end=/\\right\\*[)\]}.]/ fold',
    \                           'start=/\\left\\l[vV]ert/ end=/\\right\\r[vV]ert/ fold',
    \                           'start=/\\[bB]igl\\*[(\[{.]/ end=/\\[bB]igr\\*[)\]}.]/ fold',
    \                           'start=/\\[bB]iggl\\*[(\[{.]/ end=/\\[bB]iggr\\*[)\]}.]/ fold'],
    \           'parentheses_options': 'containedin=ALL'
    \       },
    \   }
    \ }
]]


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
        theme = 'nordfox',
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

