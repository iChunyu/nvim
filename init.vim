" ==========================================
" Basic settings for NeoVim
" ==========================================
" filetype support
filetype on
filetype plugin on
filetype plugin indent on
" line number
set number
set relativenumber
" indent
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" encoding
set encoding=utf-8
" highlight
syntax on
set showmatch
set hlsearch
exec "nohlsearch"
" search
set ignorecase
set smartcase
" top/bottom margin
set scrolloff=5
" enable mouse
set mouse=a
" extra
let g:mapleader = " "                                         " set <leader> key
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

" Map 0 and $ only in normal mode (screen line)
nnoremap g0 0
nnoremap 0 g0
nnoremap $ g$
nnoremap g$ $

" Centering search results
noremap = nzz
noremap - Nzz
noremap <silent> <leader><CR> :nohlsearch<CR>

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

" Other commands
noremap <leader>o o<Esc>k
noremap <leader>O O<Esc>j
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap Y "+y
noremap <c-l> 1z=


" ==========================================
" Plugins (Required: vimplug)
" ==========================================
call plug#begin()
    Plug 'SirVer/ultisnips'
    Plug 'lervag/vimtex'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'EdenEast/nightfox.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'luochen1990/rainbow'
    Plug 'tpope/vim-surround'
    Plug 'gcmt/wildfire.vim'
    Plug 'mbbill/undotree'
    Plug 'ggandor/lightspeed.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'h-hg/fcitx.nvim'
    Plug 'rcarriga/nvim-notify'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'godlygeek/tabular'
    Plug 'chentoast/marks.nvim'
    Plug 'numToStr/Comment.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
    Plug 'dhruvasagar/vim-table-mode'

    " telescope and its dependencies
    Plug 'nvim-lua/plenary.nvim'
    Plug 'BurntSushi/ripgrep'
    Plug 'sharkdp/fd'
    Plug 'nvim-telescope/telescope.nvim'

    " markdown enhancement
    Plug 'preservim/vim-markdown'
    Plug 'mzlogin/vim-markdown-toc'
    Plug 'dkarter/bullets.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()


" ==========================================
" UnitSnips: create user-defined snippets
" ==========================================
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
nnoremap R :source $MYVIMRC \| call UltiSnips#RefreshSnippets()<CR>


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
" Coc: auto completion
" ==========================================
set hidden
set updatetime=100
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
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
" Scroll help docs
inoremap <nowait><expr> <c-s> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <c-a> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-vimtex',
    \ 'coc-ltex' ]


" ==========================================
" Rainbow: colorful brackets
" ==========================================
let g:rainbow_active = 1
let g:rainbow_conf = {
    \   'guifgs': ['#2D85F0','#F4433C','#FFBC32','#0AA858','#B845FF','#FB7299','#8C564B','#7F7F7F','#8DA0CB'],
    \   'separately': {
    \       '*':{
    \           'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \           'parentheses_options': 'containedin=ALL'
    \       },
    \       'tex':{
    \           'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold',
    \                           'start=/\\left\\*[(\[{.]/ end=/\\right\\*[)\]}.]/ fold',
    \                           'start=/\\left\\l[vV]ert/ end=/\\right\\r[vV]ert/ fold',
    \                           'start=/\\[bB]igl\\*[(\[{.]/ end=/\\[bB]igr\\*[)\]}.]/ fold',
    \                           'start=/\\[bB]iggl\\*[(\[{.]/ end=/\\[bB]iggr\\*[)\]}.]/ fold'],
    \           'parentheses_options': 'containedin=ALL'
    \       },
    \   }
    \ }


" ==========================================
" Undotree: history tree like a local git
" ==========================================
nnoremap <leader>u :UndotreeToggle<CR>


" ==========================================
" LightSpeed: fast jump
" ==========================================
lua require'lightspeed'.setup{}
noremap L <Plug>Lightspeed_s
noremap H <Plug>Lightspeed_S


" ==========================================
" TreeSitter: highlight code
" ==========================================
" Do NOT add 'latex' for now, breaking UltiSnips feature.
"   Ref: https://github.com/nvim-treesitter/nvim-treesitter/issues/1184
lua << EOF
require'nvim-treesitter.configs'.setup {
    -- one of "all", "language", or a list of languages
    ensure_installed = {'bibtex', 'html', 'json', 'python', 'vim'},
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}
EOF


" ==========================================
" Nvim-Notify: beautiful notifications
" ==========================================
lua require'notify'.setup{}


" ==========================================
" GitSigns: Git intergration
" ==========================================
lua require'gitsigns'.setup()
noremap <silent> <leader>gd :Gitsigns preview_hunk<CR>
noremap <silent> <leader>gj :Gitsigns next_hunk<CR>
noremap <silent> <leader>gk :Gitsigns prev_hunk<CR>
noremap <silent> <leader>ga :Gitsigns stage_hunk<CR>
noremap <silent> <leader>gu :Gitsigns undo_stage_hunk<CR>
noremap <silent> <leader>gb :lua package.loaded.gitsigns.blame_line{full=true}<CR>


" ==========================================
" Tabular: align text with the given symbol
" ==========================================
vnoremap <leader>ta :Tabular /


" ==========================================
" Telescope: find files
" ==========================================
nnoremap <leader>tf <cmd>Telescope find_files<cr>
lua require'telescope'.setup{}


" ==========================================
" Markdown enhancement
" ==========================================
" vim-markdown: enable `vimtex#syntax#in_mathzone` in markdown
let g:vim_markdown_math = 1
let g:vim_markdown_folding_disabled = 1
" check if in math zone (temp, for debug)
nnoremap <leader>im i<c-r>=vimtex#syntax#in_mathzone()<cr><esc>

" markdown-preview
noremap <leader>mp <Plug>MarkdownPreviewToggle

" bullets: auto add bullets
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit']

" vim-markdown-toc: table of contents
let g:vmt_list_item_char = '-'
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'
" :GenTocGFM --- GitHub style TOC


" ==========================================
" marks.nvim
" ==========================================
lua require'marks'.setup{}


" ==========================================
" Comment
" ==========================================
lua require'Comment'.setup{}
nnoremap <c-_> <Plug>(comment_toggle_linewise_current)
vnoremap <c-_> <Plug>(comment_toggle_linewise_visual)


" ==========================================
" Colorizer
" ==========================================
lua << EOF
require'colorizer'.setup{
    '*';
}
EOF


" ==========================================
" SnipRun
" ==========================================
lua << EOF
require'sniprun'.setup{
    display = {"NvimNotify"},
    display_options = {
        notification_timeout = 10   -- timeout for nvim_notify output
  },
}
EOF
noremap <F9> <Plug>SnipRun
