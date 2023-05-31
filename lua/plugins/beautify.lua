return{
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',

    {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = function()
        vim.cmd[[colorscheme tokyonight]]
    end
    },

    {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},

    {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons'},
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

{
    'norcalli/nvim-colorizer.lua',
    config = function()
        require 'colorizer'.setup()
    end
},

{
    'chentoast/marks.nvim',
   config = true
},

}
