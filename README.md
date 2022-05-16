# 某春雨自用的 NeoVim 配置

本配置文档基本上都是从大佬们分享的配置中东拼西凑构成的，为此非常[感谢](#致谢与参考)他们的分享。本文档只是这些技巧的拙劣说明。

<!-- TOC GFM -->

- [使用前的准备](#使用前的准备)
- [使用方法](#使用方法)
- [基本配置](#基本配置)
    - [文件类型支持](#文件类型支持)
    - [行号](#行号)
    - [缩进](#缩进)
    - [编码](#编码)
    - [高亮](#高亮)
    - [搜索](#搜索)
    - [上下边距](#上下边距)
    - [主键和 Python](#主键和-python)
    - [恢复光标](#恢复光标)
- [键位映射](#键位映射)
    - [光标移动](#光标移动)
    - [搜索跳转与取消高亮](#搜索跳转与取消高亮)
    - [分屏](#分屏)
    - [标签页](#标签页)
    - [常用短命令](#常用短命令)
- [插件简介](#插件简介)
    - [ultisnips：代码片段](#ultisnips代码片段)
    - [vimtex：LaTeX 支持](#vimtexlatex-支持)
    - [nightfox.nvim：配色方案](#nightfoxnvim配色方案)
    - [vim-airline：美化状态栏](#vim-airline美化状态栏)
    - [coc.nvim：代码补全](#cocnvim代码补全)
    - [rainbow：彩色括号](#rainbow彩色括号)
    - [wildfire.vim：选择成对符号内字符](#wildfirevim选择成对符号内字符)
    - [undotree：撤销历史](#undotree撤销历史)
    - [lightspeed.nvim：快速跳转](#lightspeednvim快速跳转)
    - [nvim-treesitter：高亮强化](#nvim-treesitter高亮强化)
    - [fcitx.nvim：输入法切换](#fcitxnvim输入法切换)
    - [nvim-notify：弹窗美化](#nvim-notify弹窗美化)
    - [gitsigns.nvim：Git 集成](#gitsignsnvimgit-集成)
    - [tabular：指定字符对齐文本](#tabular指定字符对齐文本)
    - [telescope.nvim：搜索文件](#telescopenvim搜索文件)
    - [vim-markdown-toc：Markdown 生成目录](#vim-markdown-tocmarkdown-生成目录)
    - [bullets.vim：自动列表](#bulletsvim自动列表)
    - [markdown-preview.nvim：Makrdown 预览](#markdown-previewnvimmakrdown-预览)
- [致谢与参考](#致谢与参考)

<!-- /TOC -->

## 使用前的准备

在使用本配置前，请确保已经安装：

- [NeoVim](https://neovim.io/) 及其必要依赖；
- [vim-plug](https://github.com/junegunn/vim-plug) 插件管理器；

以下内容可选，用于增强功能和美化：

- [xclip](https://github.com/astrand/xclip)：启用 `+` 寄存器，即系统剪切板；
- [powerline-fonts](https://github.com/powerline/powerline)：用于 `airline` 插件美化。

目前我两台电脑分别使用了 Manjaro 和 Arch Linux，因此上述内容可以通过 `yay` 快速安装：

```bash
yay -S neovim python-pynvim     # NeoVim 和 Python 依赖
yay -S vim-plug                 # 插件管理器
yay -S xclip powerline-fonts    # [可选] 系统剪切板和美化字体
```

## 使用方法

将本仓库克隆到用户配置文件夹下，对于 Linux 用户，可使用以下命令：

```bash
git clone https://github.com/iChunyu/nvim.git ~/.config/nvim/
```

进入 NeoVim 后运行 `:PlugInstall` 等待插件安装完成即可。

## 基本配置

利用 `set` 等关键字可以对 [Neo]Vim 进行最基本的设置，在本配置中，基本配置有（为了避免与设置内容产生混淆，后面用 `<XXX>` 表示省略）：

> 使用 `:h <XXX>` 可以查看帮助文档。

### 文件类型支持

`init.vim` 的配置是全局生效的，如果需要对特定（后缀）文件进行特定的设置，需要开启文件类型支持。相应的配置文件以 `[后缀名].vim` 放置在 `ftplugin` 文件夹下。

```vim
filetype on
filetype plugin on
filetype plugin indent on
```

### 行号

下面两条命令分别启用行号和设置相对行号，以便于快速跳转到指定行。

```vim
set number
set relativenumber
```

### 缩进

`autoindent` 和 `smartindent` 启动自动智能缩进，其功能是根据上一行的缩进自动缩进下一行，并且如果下一行置空时会自动删除缩进，只保留空行。除此之外，我喜欢 4 个空格长度的缩进，并且将制表符展开为 4 个空格。因此缩进相关的设置为：

```vim
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
```

### 编码

设置 [Neo]Vim 默认编辑文本时使用 UTF-8 编码：

```vim
set encoding=utf-8
```

### 高亮

[Neo]Vim 具有基本的高亮功能：

```vim
syntax on               " 语法高亮
set showmatch           " 当光标置于成对符号（例如括号）时，高亮匹配的符号对
set hlsearch            " 搜索结果高亮
```

在搜索高亮的设置下，打开之前的文件会高亮之前的搜索结果，为此我们希望在打开文件时将之前的搜索高亮关闭，加入了以下设置：

```vim
exec "nohlsearch"
```

### 搜索

使用 `ignorecase` 设置搜索时忽略大小写，进一步设置 `smartcase`。这样，当搜索时手动区分大小写时搜索结果将对大小写敏感。

```vim
set ignorecase
set smartcase
```

### 上下边距

为了避免光标移动到最顶和最低时看不到附近内容，设置边距至少为 5 行：

```vim
set scrolloff=5
```

### 主键和 Python

[Neo]Vim 可以定义一个主键（Leader Key），这在构造组合键时非常有用。通常可以设置为空格键：

```vim
let g:mapleader = " "
```

除此之外，[Neo]Vim 的一些功能依赖于 Python3，设置其路径：

```vim
let g:python3_host_prog = '/usr/bin/python'
```

> 上述路径在 Linux 的各种发行版中基本不变，但使用时请确认 `python` 是否映射为了 `python3`。Windows 用户请自行设置。

### 恢复光标

[Neo]Vim 在打开文件时光标默认在文件的顶部，为了恢复到上一次关闭时的位置，可以使用以下设置：

```vim
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
```

## 键位映射

[Neo]Vim 可以使用 `map`、`noremap` 对键位进行映射，区别在于是否递归映射。非必要情况下，我们都会使用非递归映射 `noremap`。更进一步，该命令还可以加入 `n` 或 `v` 等前缀指定该映射只在特定模式下生效。

### 光标移动

[Neo]Vim 光标的基本移动是：`h` 左， `j` 下，`k` 上，`l` 右。本配置文档保留这种移动方式。

如果一行文本太长（比如写 LaTeX 时），[Neo]Vim 显示时会默认换行（`set wrap`），因此屏幕现实的行与换行符区别的实际行会出现差别。[Neo]Vim 的移动默认是实际行的移动，为了使用屏幕行（`gj`，`gk`）移动，将键位映射进行了交换：

```vim
noremap j gj
noremap k gk
noremap gj j
noremap gk k
```

为了跟快速跳转，使用大写按键（`Shift` 加字符的组合）进行 5 行跳转：

```vim
noremap J 5gj
noremap K 5gk
```

特别地，`0` 和 `$` 默认情况下分别表示实际行的行首和行尾，我只在普通模式下将其与屏幕行跳转进行交换，这是因为偶尔会需要从当前位置复制到行尾，可视模式下的 `$` 保留为实际行比较实用。

```vim
nnoremap g0 0
nnoremap 0 g0
nnoremap $ g$
nnoremap g$ $
```

### 搜索跳转与取消高亮

[Neo]Vim 进行搜索后使用 `n` 和 `N` 分别可以向后、向前继续查找；而使用 `zz` 可以将当前行居中，因此结合这两个功能，并将继续查找设置为更常用（输入法常用）的 `=` 和 `-` 键：

```vim
noremap = nzz
noremap - Nzz
```

除此，由于设置了高亮，搜索结果会始终高亮，将取消高亮映射给空格（`<leader>`）和回车（`<CR>`）：

```vim
noremap <leader><CR> :nohlsearch<CR>
```

### 分屏

分屏（split）是很常用的功能，但 [Neo]Vim 开启分屏需要使用多个组合键或输入较长的命令。为此，将 `s` 加移动键映射为该方向上的分屏。需要说明的是，按下 `s` 后会触发 [Neo]Vim 默认的替换功能（substitute，删除当前字符并进入插入模式），该操作有其他替换，所以可以将 `s` 的功能置空（nop：no operation）以接受后面的指令：

```vim
noremap s <nop>
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
```

使用空格加方向键实现分屏之间的跳转：

```vim
noremap <leader>l <c-w>l
noremap <leader>h <c-w>h
noremap <leader>j <c-w>j
noremap <leader>k <c-w>k
```

使用空格加大写方向键将当前分屏放置到指定方向的最边缘：

```vim
noremap <leader>L <c-w>L
noremap <leader>H <c-w>H
noremap <leader>J <c-w>J
noremap <leader>K <c-w>K
```

使用上下左右键调整当前分屏的高度和宽度：

```
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical res -5<CR>
noremap <right> :vertical res +5<CR>
```

### 标签页

如果分屏解决不了需求，还可以使用标签页（tab page），映射 `ta` 为新建标签页，`th` 和 `tl` 分别向左右跳转：

```vim
noremap ta :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
```

### 常用短命令

利用键位映射还可以将一些常用命令映射到给定快捷键：

```vim
noremap <leader>o o<Esc>k               “ 空格加小写字母 o：向下插入空行
noremap <leader>O O<Esc>j               ” 空格加大写字母 O：向上插入空行
noremap <leader>w :w<CR>                “ 空格加小写字母 w：保存文档
noremap <leader>q :q<CR>                ” 空格加小写字母 q：退出 [Neo]Vim
noremap Y "+y                           “ 大写字母 Y：复制到系统剪切板
nnoremap R :source $MYVIMRC<CR>         “ 普通模式下大写字母 R：刷新 [Neo]Vim 配置
```

## 插件简介

本配置使用 [vim-plug](https://github.com/junegunn/vim-plug) 对插件进行管理，在配置文件中的 `call plug#begin()` 和 `call plug#end()` 之间使用关键字 `Plug` 可以对插件进行管理。

### ultisnips：代码片段

[ultisnips](https://github.com/SirVer/ultisnips) 插件提供了简单的语法以自定义代码片段，特定文件的代码片段默认放置在配置文件目录下 `UltiSnips/` 文件夹内，命名格式为 `[后缀名].snippets`。也可以任意命名为 `*.snippets` 并放置在以后缀名为名的子文件下。特别地，`all.snippets` 对所有文件都生效。

编写代码片段的基本语法如下（中文用于提示，中括号及其里面内容为可选项）：

```snippets
snippet 关键字 ["提示"] [展开选项]
代码片段
snippets 
```

其中关键字用于触发代码片段，当在插入模式输入代码片段后，会根据所设置的 `[展开选项]` （默认手动展开）判定是否展开。`["提示"]` 用于提示当前代码片段的作用，当设置 `[展开选项]` 时必须设置 `["提示"]`。可选的展开设置有：

- `A`：检测到关键字之后自动展开；
- `r`：使用正则表达式判定关键字，此时关键字需要用引号包围；
- `w`：单独出现关键词时才能触发（关键词两边不是字母）；
- `i`：与 `w` 相反，关键字在单词内部时才能触发；
- `b`：当关键词为行首时才能触发。

上述选项可以结合使用，例如 `bA` 表示关键词出现在行首时自动展开代码片段。

代码片段内部可以设置多个断点，分别用 `$1`、`$2` 等标记，同时可以使用形如 `${1:默认值}` 设置相应断点位置的默认值。特别地，`$0` 是最后一个断点。

该插件还支持使用 Python，形如：

```snippets
snippet 关键字 ["提示"] [展开选项]
`!p
Python 代码
snip.rv = 输出内容
`
snippets 
```

当使用正则表达式时，匹配结果可以通过形如 `match.group(1)` 的方式进行调用；输出到代码片段的内容只需要赋值给变量 `snip.rv` 即可。

编写好代码片段文件后，在 [Neo]Vim 的配置文件中设置触发键即可。一般情况下，我们会使用 `<tab>` 展开代码片段，但测试发现这样会与后文的自动补全冲突，因此这里将触发设置成了 `<c-j>` 。同时分别用 `<c-j>` 和 `<c-k>` 跳转到下一个或上一个断点。下面配置的最后一行手动指定（限定）代码片段的搜索路径，以加快加载速度。

``` vim
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
```

> 如果使用 `jk` 触发代码片段，容易在选择模式出现问题，例如：利用 `V` 进行整行选择，`j` 向下扩展时会出现延时；若选择多了，快速按 `k` 回退时会删除所选内容并进入写入模式。

### vimtex：LaTeX 支持

[vimtex](https://github.com/lervag/vimtex) 提供了大量的 LaTeX 支持，这里我没有进行深入设置。

> 详细的配置可以参考后文致谢中提到的 Elijan Mastnak 的博客，他的讲解非常详细。

### nightfox.nvim：配色方案

[nightfox.nvim](https://github.com/EdenEast/nightfox.nvim) 提供了很多配色方案，个人倾向于其中的 Nord 方案，同时高亮当前的屏幕行：

``` vim
colorscheme nordfox
set cursorlineopt=screenline
set cursorline
```

### vim-airline：美化状态栏

[vim-airline](https://github.com/vim-airline/vim-airline) 和 [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) 提供了底部状态栏的美化方案。相应配置参考了 Vi Stack Exchange 上的[方案](https://vi.stackexchange.com/questions/3359/how-do-i-fix-the-status-bar-symbols-in-the-airline-plugin)。不再赘述。


### coc.nvim：代码补全

[coc.nvim](https://github.com/neoclide/coc.nvim) 提供了强大的代码补全功能，通过 `:CocInstall` 进一步安装相关语言的扩展就可以启用代码补全。除了必要的设置外，关键在于设置 `<tab>` 键触发自动补全，核心配置为：

``` vim
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
```

除此之外，通过一下方式设置 coc 的自动安装插件。其中 `coc-marketplace` 提供了 `:CocList marketplace` 搜索插件的功能。

``` vim
let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-json',
    \ 'coc-python' ]
```

> 其他设置请参考致谢部分 TheCW 的视频教程。

### rainbow：彩色括号

[rainbow](https://github.com/luochen1990/rainbow) 提供了成对符号用颜色匹配的功能，设置中只需要激活即可：

``` vim
let g:rainbow_active = 1
```

### wildfire.vim：选择成对符号内字符

[wildfire.vim](https://github.com/gcmt/wildfire.vim) 提供了使用回车快速选择成对符号内字符的功能。嵌套使用函数时，如 `sin(linspace(0,2*pi,200))` ，将光标放到内部，多次按回车可以扩选括号匹配的内容。

### undotree：撤销历史

[undotree](https://github.com/mbbill/undotree) 提供了类似 Git 分支的以树形图现实的撤销历史，并可以恢复到特定节点重新开始。基本使用时只需要将触发撤销树的指令映射到给定快捷键即可，这里使用的是空格和 `u` （undo）：

``` vim
nnoremap <leader>u :UndotreeToggle<CR>
```

### lightspeed.nvim：快速跳转

[lightspeed.nvim](https://github.com/ggandor/lightspeed.nvim) 提供了基于数个字符在行间进行跳转的功能。其默认使用小写和大写的 `s` 分别向后、向前跳转。然而，如前所属，单独的小写 `s` 必须映射为 `<nop>` 以配合分屏操作。因此，这里将向后、向前跳转分别映射为 `L` 和 `H`，以与前面配置的 `J` 和 `K` 多行跳转相一致。

``` vim
lua require'lightspeed'.setup{}
noremap L <Plug>Lightspeed_s
noremap H <Plug>Lightspeed_S
```

当在普通模式输入 `L` 时，以光标所在位置为界，触发向后跳转。其后向字符大部分变为灰色。部分高亮字符意味着可以直接跳转。输入目标字符的首字母后，高亮会有所改变，部分甚至会临时改变附近字符以辅助定位跳转。简言之，键入 `L` 后盯住目标位置，输入前几个字符即可实现跳转。

### nvim-treesitter：高亮强化

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 强化了代码高亮，其设置基于 Lua，本配置只对 `ensure_installed` 进行了配置，强化指定文件的高亮功能。

``` vim
lua << EOF
require'nvim-treesitter.configs'.setup {
    -- one of "all", "language", or a list of languages
    ensure_installed = {'bibtex', 'html', 'json', 'python', 'vim'},
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}
EOF
```

> 该插件的 LaTeX 支持会导致 UltiSnip `context` 判断数学环境的功能失效，因此这里没有开启，详见 [该 Issue](https://github.com/nvim-treesitter/nvim-treesitter/issues/1184)。

### fcitx.nvim：输入法切换

[fcitx.nvim](https://github.com/h-hg/fcitx.nvim) 提供了 Fcitx5 下使用 NeoVim 编辑中文文档时中文输入法自动切换的功能。

### nvim-notify：弹窗美化

[nvim-notify](https://github.com/rcarriga/nvim-notify) 对 NeoVim 可能出现的弹窗进行了美化，这里使用了默认配置。

### gitsigns.nvim：Git 集成

[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) 将 Git 集成到了 NeoVim 中，本配置在默认方案的基础上，只对部分功能的快捷键进行了重新映射：

``` vim
lua require'gitsigns'.setup()
noremap <leader>gd :Gitsigns preview_hunk<CR>
noremap <leader>gj :Gitsigns next_hunk<CR>
noremap <leader>gk :Gitsigns prev_hunk<CR>
noremap <leader>ga :Gitsigns stage_hunk<CR>
noremap <leader>gu :Gitsigns undo_stage_hunk<CR>
```

快捷键及其功能为：

- `<leader>gd`：查看当前行的改动（`d` 理解为 diff）；
- `<leader>gj`：查看下一处改动（`j` 为向下移动）；
- `<leader>gk`：查看上一处改动（`k` 为向上移动）；
- `<leader>ga`：将当前行的改动提交到暂存区（`a` 理解为 add）；
- `<leader>gu`：撤销提交暂存区（`u` 理解为 undo）。

### tabular：指定字符对齐文本

[tabular](https://github.com/godlygeek/tabular) 可以指定字符串，使多行文本对齐。常用于代码中 `=` 对齐。

为了方便使用，映射了可选模式下 `<leader>t` 作为指定对齐字符的快捷键：

``` vim
vnoremap <leader>t :Tabular /
```

使用时在可视模式下选择需要对齐的文本，按下空格和 `t`，输入对齐的字符，回车即可。

### telescope.nvim：搜索文件

[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 提供了搜索文件的功能，为了正确使用，需要安装依赖：[plenary.nvim](https://github.com/nvim-lua/plenary.nvim)，[ripgrep](https://github.com/BurntSushi/ripgrep)，[fd](https://github.com/sharkdp/fd)。

此配置使用了插件的默认设置，仅将查找文件界面的功能映射到了 `<leader>tf`：

``` vim
nnoremap <leader>tf <cmd>Telescope find_files<cr>
lua require'telescope'.setup{}
```

普通模式使用空格和 `tf` 触发搜索窗口查找文件后，按下回车在当前窗口打开文件，或使用 `<c-x>` 分屏打开文件，也可以使用 `<c-t>` 在新标签页打开文件。

### vim-markdown-toc：Markdown 生成目录

[vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc) 插件提供了命令生成目录，这里只做了一些无关紧要的配置。 主要的命令有：

- `:GenTocGFM` 生成 GFM 样式的目录，可用于 GitHub；
- `:GenTocRedcarpet` 生成 Redcarpet 样式的目录；
- `:GenTocGitLab` 生成 GitLab 样式的目录；
- `:GenTocMarked` 生成用于 Marked 解析的目录。
    
### bullets.vim：自动列表

[bullets.vim](https://github.com/dkarter/bullets.vim) 可以根据前文连续生成相应的列表样式，例如 Markwon 中 `-` 所引导的无序列表。使用时只需要配置该插件使用的文件类型即可：

``` vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit']
```

### markdown-preview.nvim：Makrdown 预览

[markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) 提供了 Markdown 的预览功能，这里只把触发预览的键位进行了映射：

``` vim
noremap <leader>mp <Plug>MarkdownPreviewToggle
```

## 致谢与参考

特别感谢 [David Chen](https://github.com/theniceboy) （哔哩哔哩：[TheCW](https://space.bilibili.com/13081489/)）在哔哩哔哩上对 [Neo]Vim 的详细介绍和展示，这是促使我入坑的主要因素；同时也感谢他分享的配置文档。相关链接如下：

- [上古神器Vim：从恶言相向到爱不释手 - 终极Vim教程01 - 带你配置属于你自己的最强IDE](https://www.bilibili.com/video/BV164411P7tw)
- [上古神器Vim：进阶使用/配置、必备插件介绍 - 终极Vim教程02 - 带你配置属于你自己的最强IDE](https://www.bilibili.com/video/BV1e4411V7AA)
- [「妈妈不会告诉你的Vim技巧」 -Vim终极教程03 - 带你配置属于你自己的最强IDE](https://www.bilibili.com/video/BV1r4411G7de)
- [21世纪最强代码编辑器：NeoVim ——就是这些设置让它变成了编辑器之鬼 【附配置与插件教程】](https://www.bilibili.com/video/BV1y4411C7pE)
- [【硬货】让你的vim像vscode一样强大 —— coc.nvim终极指南](https://www.bilibili.com/video/BV1Ka4y1E7AM)
- [Colemak 用户使用的 NeoVim 配置文件](https://github.com/theniceboy/nvim)

非常感谢 [Elijan Mastnak](https://github.com/ejmastnak) 关于使用 NeoVim 编辑 LaTeX 的系列文章，这为我配置 VimTeX 时提供了重要的参考。相关链接如下：

- [Real-time LaTeX Using (Neo)Vim](https://ejmastnak.github.io/tutorials/vim-latex/intro.html)
- [1. Suggested Prerequisites for Writing LaTeX in Vim](https://ejmastnak.github.io/tutorials/vim-latex/prerequisites.html)
- [2. An UltiSnips guide for LaTeX workflows](https://ejmastnak.github.io/tutorials/vim-latex/ultisnips.html)
- [3. Vim’s `ftplugin` system](https://ejmastnak.github.io/tutorials/vim-latex/ftplugin.html)
- [4. Getting started with the VimTeX plugin](https://ejmastnak.github.io/tutorials/vim-latex/vimtex.html)
- [5. Compiling LaTeX Documents in a Vim-Based Workflow](https://ejmastnak.github.io/tutorials/vim-latex/compilation.html)
- [6. Setting Up a PDF Reader for Writing LaTeX with Vim](https://ejmastnak.github.io/tutorials/vim-latex/pdf-reader.html)
- [7. A Vimscript Primer for Filetype-Specific Workflows](https://ejmastnak.github.io/tutorials/vim-latex/vimscript.html)

Jacob Banks 整理的 [Collections of Awesome Neovim Plugins](https://morioh.com/p/a7063de46490) 为本配置使用的插件提供了参考。

最后，向所有插件开发者致敬！
