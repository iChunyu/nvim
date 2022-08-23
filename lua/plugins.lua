-- Validate `parker.nvim` and install if necessary
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd('packadd packer.nvim')
end


require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP and autocompletion
    use 'neovim/nvim-lspconfig'     -- Collection of configurations for built-in LSP client
    use 'hrsh7th/nvim-cmp'          -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'      -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'  -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'          -- Snippets plugin

    -- Colorscheme
    use {'EdenEast/nightfox.nvim', config = function() vim.cmd('colorscheme nightfox') end}

    -- Snippets
    -- NOTE: tex snippets works correctly with `vimtex`
    use {'SirVer/ultisnips', config = function() require('config.ultisnips') end}

    -- LaTeX and Markdown
    use 'lervag/vimtex'
    use 'hrsh7th/cmp-omni'          -- Enable nvim-cmp autocompletion

    -- Beautify
    use 'kyazdani42/nvim-web-devicons'
    use {'nvim-lualine/lualine.nvim', config = function() require('lualine').setup() end}
end)


require('config.lsp')
