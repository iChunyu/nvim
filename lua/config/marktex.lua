local map = vim.keymap.set

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


------------------------------------------
-- markdown-preview: keymap
------------------------------------------
map('', '<leader>mp', '<Plug>MarkdownPreviewToggle')
