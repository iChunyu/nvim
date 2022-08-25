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
