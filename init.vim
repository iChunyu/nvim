" Requirements
" `xclip` to enable system clipboard (register +/*)
" `vim-plug` to enable plug managements
" `pynvim` package from `pip`

syntax on
set number
set relativenumber
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set fileencodings=utf-8
set showmatch
set hlsearch
set scrolloff=5

nnoremap j gj
nnoremap k gk

" Plug-ins
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" UnitSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="jk"
let g:UltiSnipsJumpBackwardTrigger="kj"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']     " specify folder to save time

" vimtex settings
filetype plugin indent on
syntax enable
let g:vimtex_view_method = 'zathura'

let g:python3_host_prog = '/usr/bin/python'

