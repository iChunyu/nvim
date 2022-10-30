local map = vim.keymap.set

------------------------------------------
-- vimtex
------------------------------------------
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


------------------------------------------
-- ultisnip
------------------------------------------
vim.g['UltiSnipsExpandTrigger'] = '<c-j>'
vim.g['UltiSnipsJumpForwardTrigger'] = '<c-j>'
vim.g['UltiSnipsJumpBackwardTrigger'] = '<c-k>'



------------------------------------------
-- vim-markdown: enable `vimtex#syntax#in_mathzone` in markdown
------------------------------------------
vim.g['vim_markdown_math'] = 1
vim.g['vim_markdown_folding_disabled'] = 1


------------------------------------------
-- vim-markdown-toc: table of contents
-- :GenTocGFM --- GitHub style TOC
------------------------------------------
vim.g['vmt_list_item_char'] = '-'
vim.g['vmt_fence_text'] = 'TOC'
vim.g['vmt_fence_closing_text'] = '/TOC'
require('command_center').add({
    {
        desc = 'Generate GitHub style TOC',
        cmd = '<cmd>GenTocGFM<cr>',
        category = 'markdown'
    }, {
        desc = 'Generate Redcarpet style TOC',
        cmd = '<cmd>GenTocRedcarpet<cr>',
        category = 'markdown'
    }, {
        desc = 'Generate GitLab style TOC',
        cmd = '<cmd>GenTocGitLab<cr>',
        category = 'markdown'
    }, {
        desc = 'Generate Marked style TOC',
        cmd = '<cmd>GenTocMarked<cr>',
        category = 'markdown'
    }
})


------------------------------------------
-- markdown-preview: keymap
------------------------------------------
map('', '<leader>mp', '<Plug>MarkdownPreviewToggle')
