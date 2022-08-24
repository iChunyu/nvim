-- vim-markdown: enable `vimtex#syntax#in_mathzone` in markdown
vim.g['vim_markdown_math'] = 1


-- vim-markdown-toc: table of contents
-- :GenTocGFM --- GitHub style TOC
vim.g['vmt_list_item_char'] = '-'
vim.g['vmt_fence_text'] = 'TOC'
vim.g['vmt_fence_closing_text'] = '/TOC'


-- markdown-preview: keymap
local map = vim.keymap.set
map('', '<leader>mp', '<Plug>MarkdownPreviewToggle')
