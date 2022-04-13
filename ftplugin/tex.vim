" set space as the leader leader key for `tex` filetype
let maplocalleader = " "

" VimTex settings
filetype plugin indent on
syntax enable
let g:vimtex_view_method = 'zathura'

nmap <localleader>i <plug>(vimtex-info)
nmap <localleader>v <plug>(vimtex-view)
