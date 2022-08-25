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
    use 'nvim-treesitter/nvim-treesitter'
    use 'p00f/nvim-ts-rainbow'
    -- Git integration
    use 'lewis6991/gitsigns.nvim'
    -- Navigation
    use 'ggandor/lightspeed.nvim'
    -- Editor enhancement
    use 'mbbill/undotree'
    use { 'michaelb/sniprun', run = 'bash ./install.sh' }
    -- Autoswitch input methods
    use 'h-hg/fcitx.nvim'


    -- [config.marktex] LaTeX and Markdown
    -- NOTE: tex snippets have to work with `vimtex` (to detect math zone)
    use 'SirVer/ultisnips'
    use 'lervag/vimtex'
    use 'preservim/vim-markdown'
    use 'mzlogin/vim-markdown-toc'
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' }


    -- [config.editing] Text editing
    use 'numToStr/Comment.nvim'
    use 'windwp/nvim-autopairs'
    use 'dkarter/bullets.vim'
    use 'godlygeek/tabular'


    -- [config.beautify] Beautify
    use 'kyazdani42/nvim-web-devicons'
    use 'EdenEast/nightfox.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'rcarriga/nvim-notify'
    use 'norcalli/nvim-colorizer.lua'
    use 'chentoast/marks.nvim'
end)


-- Do `PackerSync` if `packer` is installed at first time
if packer_bootstrap then
    require('packer').sync()
end


require('config.lsp')
require('config.enhance')
require('config.marktex')
require('config.editing')
require('config.beautify')
