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

" restore previous cursor location
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Movements
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap J 5gj
noremap K 5gk
" Map 0 and $ only in normal mode
nnoremap g0 0
nnoremap 0 g0
nnoremap $ g$
nnoremap g$ $
" Centering search results
noremap = nzz
noremap - Nzz
noremap <leader><CR> :nohlsearch<CR>
" Split the screen and resize
noremap s <nop>
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
noremap <leader>l <c-w>l
noremap <leader>h <c-w>h
noremap <leader>j <c-w>j
noremap <leader>k <c-w>k
noremap <leader>L <c-w>L
noremap <leader>H <c-w>H
noremap <leader>J <c-w>J
noremap <leader>K <c-w>K
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical res -5<CR>
noremap <right> :vertical res +5<CR>
" Tabs
noremap ta :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Short commands
noremap <leader>o o<Esc>k
noremap <leader>O O<Esc>j
nnoremap R :source $MYVIMRC<CR>


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
    Plug 'gcmt/wildfire.vim'
    Plug 'mbbill/undotree'
    Plug 'ggandor/lightspeed.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'h-hg/fcitx.nvim'
    Plug 'rcarriga/nvim-notify'
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
    \ 'coc-python',
    \ 'coc-git' ]


" ==========================================
" Rainbow
" ==========================================
let g:rainbow_active = 1


" ==========================================
" Undotree
" ==========================================
nnoremap <F5> :UndotreeToggle<CR>


" ==========================================
" LightSpeed
" ==========================================
lua require'lightspeed'.setup{}
noremap L <Plug>Lightspeed_s
noremap H <Plug>Lightspeed_S


" ==========================================
" TreeSitter
" ==========================================
lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- one of "all", "language", or a list of languages
    ensure_installed = {'bibtex', 'html', 'json', 'latex', 'python', 'vim'},
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}
EOF


" ==========================================
" Nvim-Notify
" ==========================================
lua vim.notify = require("notify")
