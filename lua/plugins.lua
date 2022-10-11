-- Validate `parker.nvim` and install if necessary
local map = vim.keymap.set
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd('packadd packer.nvim')
end


require('packer').startup(function(use)
    -- Necessary plugins
    use 'wbthomason/packer.nvim' -- Packer can manage itself
    use 'nvim-lua/plenary.nvim' -- All the Lua functions, depended by most plugins


    -- [lsp] LSP and autocompletion
    use 'williamboman/mason.nvim' -- LSP manager
    use 'williamboman/mason-lspconfig.nvim' -- Bridge between `mason` and `lspconfig`
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-path' -- Enable filesystem path autocompletion
    use 'hrsh7th/cmp-emoji' -- Enable emoji autocompletion
    use 'quangnguyen30192/cmp-nvim-ultisnips' -- Cmp source for UltiSnips


    -- [enhance] Editor enhance
    use 'lewis6991/gitsigns.nvim' -- Git integration
    use 'ggandor/lightspeed.nvim' -- Fast jump between words
    use 'mbbill/undotree' -- Editing history and undo
    use { 'michaelb/sniprun', run = 'bash ./install.sh' } -- Run snippets
    use 'h-hg/fcitx.nvim' -- Autoswitch input methods
    use 'kyazdani42/nvim-tree.lua' -- File explorer
    use { 'akinsho/bufferline.nvim', tag = 'v2.*' } -- Tabline
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' } -- Fuzzy finder
    use 'FeiyouG/command_center.nvim' -- Create and manage keybindings and commands
    use { 'akinsho/toggleterm.nvim', tag = '*' } -- Terminal integration


    -- [marktex] LaTeX and Markdown
    use 'SirVer/ultisnips' -- Snippets, (require `vimtex` and `vim-markdown` to detect math zone)
    use 'lervag/vimtex' -- LaTeX support
    use 'preservim/vim-markdown' -- Enable `vimtex#syntax#in_mathzone` in markdown
    use 'mzlogin/vim-markdown-toc' -- Autogenerate table of contents
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install' } -- Markdown live preview


    -- [editing] Code/text editing
    use 'numToStr/Comment.nvim' -- Comment snippets
    use 'windwp/nvim-autopairs' -- Finish brackets
    use 'dkarter/bullets.vim' -- Generate bullets list
    use 'godlygeek/tabular' -- Align text with given symbol
    use { 'filipdutescu/renamer.nvim', branch = 'master' } -- Rename variables
    use 'tversteeg/registers.nvim' -- Preview the contents of the registers


    -- [beautify] Beautify
    use 'kyazdani42/nvim-web-devicons' -- Icons
    use 'EdenEast/nightfox.nvim' -- Colorscheme
    use 'nvim-lualine/lualine.nvim' -- Status line
    use 'rcarriga/nvim-notify' -- Notify style
    use 'norcalli/nvim-colorizer.lua' -- Show color in text
    use 'chentoast/marks.nvim' -- Show bookmarks
    use 'lukas-reineke/indent-blankline.nvim' -- Show indent lines
end)


-- Do `PackerSync` if `packer` is installed at first time
if packer_bootstrap then
    require('packer').sync()
end
map('n', '<leader>ps', ':PackerSync<CR>')
