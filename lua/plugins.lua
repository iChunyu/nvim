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
    -- All the Lua functions, depended by most plugins
    use 'nvim-lua/plenary.nvim'


    -- [config.lsp] LSP and autocompletion
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-omni' -- Enable `vimtex` autocompletion
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin


    -- [config.enhance] Editor enhance
    -- Treesitter and treesitter-depended plugins
    use { 'nvim-treesitter/nvim-treesitter', config = function() require('config.treesitter') end }
    use 'p00f/nvim-ts-rainbow'
    -- Git integration
    use { 'lewis6991/gitsigns.nvim', config = function() require('config.gitsigns') end }
    -- Navigation
    use { 'ggandor/lightspeed.nvim', config = function() require('config.lightspeed') end }
    -- Editor enhancement
    use 'mbbill/undotree'
    use { 'michaelb/sniprun', run = 'bash ./install.sh' }
    -- Autoswitch input methods
    use 'h-hg/fcitx.nvim'


    -- [config.tex-md] LaTeX and Markdown
    -- NOTE: tex snippets have to work with `vimtex` (to detect math zone)
    use { 'SirVer/ultisnips', config = function() require('config.ultisnips') end }
    use 'lervag/vimtex'
    use 'preservim/vim-markdown'
    use 'mzlogin/vim-markdown-toc'
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' }


    -- [config.editing] Text editing
    use { 'numToStr/Comment.nvim', config = function() require('config.comment') end }
    use { 'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup() end }
    use 'dkarter/bullets.vim'
    use 'godlygeek/tabular'


    -- [config.beautify] Beautify
    use 'kyazdani42/nvim-web-devicons'
    use { 'EdenEast/nightfox.nvim', config = function() vim.cmd('colorscheme nightfox') end }
    use { 'nvim-lualine/lualine.nvim', config = function() require('lualine').setup() end }
    use { 'rcarriga/nvim-notify', config = function() vim.notify = require("notify") end }
    use { 'norcalli/nvim-colorizer.lua', config = function() require 'colorizer'.setup() end }
    use { 'chentoast/marks.nvim', config = function() require('marks').setup() end }
end)


-- Do `PackerSync` if `packer` is installed at first time
if packer_bootstrap then
    require('packer').sync()
end


require('config.lsp')
require('config.markdown')
require('config.text')
require('config.editor')
