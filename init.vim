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

" Plugins
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'EdenEast/nightfox.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Python 3 configuration
let g:python3_host_prog = '/usr/bin/python'

" UnitSnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="jk"
let g:UltiSnipsJumpBackwardTrigger="kj"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']     " specify folder to save time

" VimTex settings
filetype plugin indent on
syntax enable
let g:vimtex_view_method = 'zathura'

" Colorscheme
colorscheme nordfox
set cursorlineopt=screenline
set cursorline

" AirLine
" install `powerline-fonts`
" Ref `:help airline-customization`
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
