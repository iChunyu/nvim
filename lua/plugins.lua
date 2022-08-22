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
    use {'EdenEast/nightfox.nvim', config = vim.cmd('colorscheme nightfox')}

    -- Snippets
    -- NOTE: tex snippets works correctly with `vimtex`
    use {'SirVer/ultisnips', config = require('config.ultisnips')}

    -- LaTeX and Markdown
    use 'lervag/vimtex'
end)


require('config.lsp')
