# 某春雨自用的 NeoVim 配置

本配置文档基本上都是从各大佬的配置中东拼西凑构成的，为此我在本说明文档的结尾给出相关的[参考资料](#参考资料)，[感谢](#致谢)大佬们的分享。本文档只是大佬们分享的技巧的拙劣拼凑。

<!-- TOC GFM -->

* [使用前的准备](#使用前的准备)
* [使用方法](#使用方法)
* [基本配置](#基本配置)
    - [文件类型支持](#文件类型支持)
    - [行号](#行号)
    - [缩进](#缩进)
    - [编码](#编码)
    - [高亮](#高亮)
    - [搜索](#搜索)
    - [上下边距](#上下边距)
    - [主键和 Python](#主键和-python)
    - [恢复光标](#恢复光标)
* [键位映射](#键位映射)
    - [光标移动](#光标移动)
    - [搜索跳转与取消高亮](#搜索跳转与取消高亮)
    - [分屏](#分屏)
    - [标签页](#标签页)
    - [常用短命令](#常用短命令)
* [插件简介](#插件简介)
* [致谢](#致谢)
* [参考资料](#参考资料)

<!-- /TOC -->

## 使用前的准备

在使用本配置前，请确保已经安装：

- [NeoVim](https://neovim.io/) 及其必要依赖；
- [vim-plug](https://github.com/junegunn/vim-plug) 插件管理器；

以下内容可选，用于增强功能和美化：

- [xclip](https://github.com/astrand/xclip)：启用 `+` 寄存器，即系统剪切板；
- [powerline-fonts](https://github.com/powerline/powerline)：用于 `airline` 插件美化。

目前我两台电脑分别使用了 Manjaro 和 Arch Linux，因此上述内容可以通过 `yay` 快速安装：

``` bash
yay -S neovim python-pynvim     # NeoVim 和 Python 依赖
yay -S vim-plug                 # 插件管理器
yay -S xclip powerline-fonts    # [可选] 系统剪切板和美化字体
```

## 使用方法

将本仓库克隆到用户配置文件夹下，对于 Linux 用户，可使用以下命令：

``` bash
git clone https://github.com/iChunyu/nvim.git ~/.config/nvim/
```

进入 NeoVim 后运行 `:PlugInstall` 等待插件安装完成即可。

## 基本配置

利用 `set` 等关键字可以对 [Veo]Vim 进行最基本的设置，在本配置中，基本配置有（为了避免与设置内容产生混淆，后面用 `<XXX>` 表示省略）：

> 使用 `:h <XXX>` 可以查看帮助文档。

### 文件类型支持

`init.vim` 的配置是全局生效的，如果需要对特定（后缀）文件进行特定的设置，需要开启文件类型支持。相应的配置文件以 `[后缀名].vim` 放置在 `ftplugin` 文件夹下。

``` vim
filetype on
filetype plugin on
filetype plugin indent on
```

### 行号

下面两条命令分别启用行号和设置相对行号，以便于快速跳转到指定行。

``` vim
set number
set relativenumber
```

### 缩进

`autoindent` 和 `smartindent` 启动自动智能缩进，其功能是根据上一行的缩进自动缩进下一行，并且如果下一行置空时会自动删除缩进，只保留空行。除此之外，我喜欢 4 个空格长度的缩进，并且将制表符展开为 4 个空格。因此缩进相关的设置为：

``` vim
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
```

### 编码

设置 [Neo]Vim 默认编辑文本时使用 UTF-8 编码：

``` vim
set encoding=utf-8
```

### 高亮

[Neo]Vim 具有基本的高亮功能：

- `syntax on`：语法高亮；
- `set showmatch`：当光标置于成对符号（例如括号）时，高亮匹配的符号对；
- `hlsearch`：搜索结果高亮。

在搜索高亮的设置下，打开之前的文件会高亮之前的搜索结果，为此我们希望在打开文件时将之前的搜索高亮关闭，加入了以下设置：

``` vim
exec "nohlsearch"
```

### 搜索

使用 `ignorecase` 设置搜索时忽略大小写，进一步设置 `smartcase`。这样，当搜索时手动区分大小写时搜索结果将对大小写敏感。

``` vim
set ignorecase
set smartcase
```

### 上下边距

为了避免光标移动到最顶和最低时看不到附近内容，设置边距至少为 5 行：

``` vim
set scrolloff=5
```

### 主键和 Python 

[Neo]Vim 可以定义一个主键（Leader Key），这在构造组合键时非常有用。通常可以设置为空格键：

``` vim
let g:mapleader = " "
```

除此之外，[Neo]Vim 的一些功能依赖于 Python3，设置其路径：

``` vim
let g:python3_host_prog = '/usr/bin/python'
```

> 上述路径在 Linux 的各种发行版中基本不变，但使用时请确认 `python` 是否映射为了 `python3`。Windows 用户请自行设置。

### 恢复光标

[Neo]Vim 在打开文件时光标默认在文件的顶部，为了恢复到上一次关闭时的位置，可以使用以下设置：

``` vim
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
```

## 键位映射

[Neo]Vim 可以使用 `map`、`noremap` 对键位进行映射，区别在于是否递归映射。非必要情况下，我们都会使用非递归映射 `noremap`。更进一步，该命令还可以加入 `n` 或 `v` 等前缀指定该映射只在特定模式下生效。

### 光标移动

[Neo]Vim 光标的基本移动是：`h` 左， `j` 下，`k` 上，`l` 右。本配置文档保留这种移动方式。

如果一行文本太长（比如写 LaTeX 时），[Neo]Vim 显示时会默认换行（`set wrap`），因此屏幕现实的行与换行符区别的实际行会出现差别。[Neo]Vim 的移动默认是实际行的移动，为了使用屏幕行（`gj`，`gk`）移动，将键位映射进行了交换：

``` vim
noremap j gj
noremap k gk
noremap gj j
noremap gk k
```

为了跟快速跳转，使用大写按键（`Shift` 加字符的组合）进行 5 行跳转：

``` vim
noremap J 5gj
noremap K 5gk
```

特别地，`0` 和 `$` 默认情况下分别表示实际行的行首和行尾，我只在普通模式下将其与屏幕行跳转进行交换，这是因为偶尔会需要从当前位置复制到行尾，可视模式下的 `$` 保留为实际行比较实用。

``` vim
nnoremap g0 0
nnoremap 0 g0
nnoremap $ g$
nnoremap g$ $
``` 

### 搜索跳转与取消高亮

[Neo]Vim 进行搜索后使用 `n` 和 `N` 分别可以向后、向前继续查找；而使用 `zz` 可以将当前行居中，因此结合这两个功能，并将继续查找设置为更常用（输入法常用）的 `=` 和 `-` 键：

``` vim
noremap = nzz
noremap - Nzz
```

除此，由于设置了高亮，搜索结果会始终高亮，将取消高亮映射给空格（`<leader>`）和回车（`<CR>`）：

``` vim
noremap <leader><CR> :nohlsearch<CR>
```

### 分屏

分屏（split）是很常用的功能，但 [Neo]Vim 开启分屏需要使用多个组合键或输入较长的命令。为此，将 `s` 加移动键映射为该方向上的分屏。需要说明的是，按下 `s` 后会触发 [Neo]Vim 默认的替换功能（substitute，删除当前字符并进入插入模式），该操作有其他替换，所以可以将 `s` 的功能置空（nop：no operation）以接受后面的指令：

``` vim
noremap s <nop>
noremap sl :set splitright<CR>:vsplit<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sk :set nosplitbelow<CR>:split<CR>
```

使用空格加方向键实现分屏之间的跳转：

``` vim
noremap <leader>l <c-w>l
noremap <leader>h <c-w>h
noremap <leader>j <c-w>j
noremap <leader>k <c-w>k
```

使用空格加大写方向键将当前分屏放置到指定方向的最边缘：

``` vim
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

``` vim
noremap ta :tabe<CR>
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
```

### 常用短命令

利用键位映射还可以将一些常用命令映射到给定快捷键：

``` vim
noremap <leader>o o<Esc>k               “ 空格加小写字母 o：向下插入空行
noremap <leader>O O<Esc>j               ” 空格加大写字母 O：向上插入空行
noremap <leader>w :w<CR>                “ 空格加小写字母 w：保存文档
noremap <leader>q :q<CR>                ” 空格加小写字母 q：退出 [Neo]Vim
noremap Y "+y                           “ 大写字母 Y：复制到系统剪切板
nnoremap R :source $MYVIMRC<CR>         “ 普通模式下大写字母 R：刷新 [Neo]Vim 配置
```

## 插件简介

## 致谢

（草稿还没完成，但致谢必须写上：感谢 [theniceboy](https://github.com/theniceboy) 的 B 站视频和配置示例！）

## 参考资料
