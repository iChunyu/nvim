local map = vim.keymap.set

return {
    -- Snippets, (require `vimtex` and `vim-markdown` to detect math zone)
    {
        'SirVer/ultisnips',
        config = function()
            vim.g['UltiSnipsExpandTrigger'] = '<c-j>'
            vim.g['UltiSnipsJumpForwardTrigger'] = '<c-j>'
            vim.g['UltiSnipsJumpBackwardTrigger'] = '<c-k>'
        end
    },

    -- LaTeX support
    {
        'lervag/vimtex',
        config = function()
            vim.g['vimtex_view_method'] = 'zathura'
            vim.g['vimtex_quickfix_open_on_warning'] = 0
            vim.g['vimtex_compiler_latexmk_engines'] = {
                _        = '-xelatex',
                pdfdvi   = '-pdfdvi',
                pdfps    = '-pdfps',
                pdflatex = '-pdf',
                luatex   = '-lualatex',
                lualatex = '-lualatex',
                xelatex  = '-xelatex',
            }
        end
    },

    -- Enable `vimtex#syntax#in_mathzone` in markdown
    {
        'preservim/vim-markdown',
        config = function()
            vim.g['vim_markdown_math'] = 1
            vim.g['vim_markdown_folding_disabled'] = 1
        end
    },

    -- Autogenerate table of contents
    {
        'mzlogin/vim-markdown-toc',
        config = function()
            vim.g['vmt_list_item_char'] = '-'
            vim.g['vmt_fence_text'] = 'TOC'
            vim.g['vmt_fence_closing_text'] = '/TOC'
        end
    },

    -- Markdown live preview
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && npm install',
        config = function()
            map('n', '<leader>mp', '<Plug>MarkdownPreviewToggle', { silent = true })
        end
    },

}
