-- Validate `parker.nvim` and install if necessary
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd('packadd packer.nvim')
end


require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP and autocompletion
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-omni' -- Enable `vimtex` autocompletion
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- All the Lua functions, depended by most plugins
    use 'nvim-lua/plenary.nvim'

    -- Snippets
    -- NOTE: tex snippets have to work with `vimtex` (to detect math zone)
    use { 'SirVer/ultisnips', config = function() require('config.ultisnips') end }

    -- LaTeX and Markdown
    use 'lervag/vimtex'

    -- Autoswitch input methods
    use 'h-hg/fcitx.nvim'

    -- Git integration
    use { 'lewis6991/gitsigns.nvim', config = function() require('config.gitsigns') end }

    -- Navigation
    use { 'ggandor/lightspeed.nvim', config = function() require('config.lightspeed') end }

    use { 'numToStr/Comment.nvim', config = function() require('config.comment') end }
    -- Beautify
    use 'kyazdani42/nvim-web-devicons'
    use { 'EdenEast/nightfox.nvim', config = function() vim.cmd('colorscheme nightfox') end }
    use { 'nvim-lualine/lualine.nvim', config = function() require('lualine').setup() end }
    use { 'rcarriga/nvim-notify', config = function() vim.notify = require("notify") end }
    use { 'norcalli/nvim-colorizer.lua', config = function() require 'colorizer'.setup() end }
end)


require('config.lsp')
