" ==========================================
" Basic settings for [Neo]Vim
" ==========================================
syntax on
filetype on
filetype plugin on
filetype plugin indent on
set number
set relativenumber
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set encoding=utf-8
set showmatch
set hlsearch
set ignorecase
set smartcase
set scrolloff=5
exec "nohlsearch"

let mapleader = " "                                         " set <leader> key
let g:python3_host_prog = '/usr/bin/python'                 " python3 location

" Map some usefull keys
noremap j gj
noremap k gk
noremap 0 g0
noremap $ g$
noremap gj j
noremap gk k
noremap g0 0
noremap g$ $
noremap J 5j
noremap K 5k
noremap = nzz
noremap - Nzz
noremap <leader><CR> :nohlsearch<CR>

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR> 
map sk :set nosplitbelow<CR>:split<CR> 
map <leader>l <c-w>l
map <leader>h <c-w>h
map <leader>j <c-w>j
map <leader>k <c-w>k
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical res -5<CR>
map <right> :vertical res +5<CR>
map sh <c-w>t<c-w>H
map sv <c-w>t<c-w>K
map ta :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>


" ==========================================
" Plugins
" ==========================================
call plug#begin()
    Plug 'SirVer/ultisnips'
    Plug 'lervag/vimtex'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'EdenEast/nightfox.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'luochen1990/rainbow'
call plug#end()


" ==========================================
" UnitSnips settings
" ==========================================
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']


" ==========================================
" Colorscheme
" ==========================================
colorscheme nordfox
set cursorlineopt=screenline
set cursorline


" ==========================================
" AirLine
" ==========================================
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


" ==========================================
" Coc configuration
" ==========================================
set hidden
set updatetime=100
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-vimtex',
    \ 'coc-json',
    \ 'coc-python' ]


" ==========================================
" Rainbow
" ==========================================
let g:rainbow_active = 1

