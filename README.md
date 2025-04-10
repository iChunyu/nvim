# 某春雨自用的 NeoVim 配置

本仓库是我自用的 NeoVim 配置，使用 Lua 进行配置。

## 目录

<!-- TOC GFM -->

- [安装前的准备](#安装前的准备)
- [基本键位映射](#基本键位映射)
- [插件配置](#插件配置)
    - [Coding](#coding)
    - [Editor](#editor)
    - [Writing](#writing)
    - [UI](#ui)
    - [Explorer](#explorer)
- [参考资料](#参考资料)

<!-- /TOC -->

## 安装前的准备

本配置文件适配最新版 [NeoVim](https://neovim.io/)，请确保其版本不低于 0.7。

为确保功能正常，请确保 [Python](https://www.python.org/) 和 [Node.js](https://nodejs.org/) 已正确安装，然后在命令行补充以下功能：

```bash
pip install pynvim
# yay -S npm
sudo npm install -g neovim
```

为确保 `Telescope` 等插件功能正常，可通过包管理器选择性安装以下工具：

- [fd](https://github.com/sharkdp/fd) 查找文件
- [ripgrep](https://github.com/BurntSushi/ripgrep) 查找字符串
- [xclip](https://github.com/astrand/xclip) 系统剪切板

插件和 LSP 应当在首次启动时自动安装，如果未能正确安装，请确保能够正常访问 GitHub 后重新启动，或手动运行 `:Lazy` 后按 `U` 进行同步。插件安装完成后可使用 `:checkhealth` 检查依赖是否正常。

`vimtex` 配置使用 [zathura](https://pwmt.org/projects/zathura/) 作为默认的 PDF 阅读器，可通过包管理器安装。

对于 ArchLinux，上述工具可以采用以下命令安装：

```bash
yay -S fd ripgrep xclip zathura zathura-mupdf
yay -S jre-openjdk          # Neovim 的 LTeX LSP 需要 Java 环境
```


## 基本键位映射

本配置文档的 `<leader>` 和 `<localleader>` 均设置为 **空格** ，其他组合键如下，注意区分大小写。

| 键             | 功能                                                     |
| :---           | :---                                                     |
| **光标移动**   |                                                          |
| `j`, `k`       | 基于屏幕行的上下移动                                     |
| `gj`, `gk`     | 基于实际行的上下移动                                     |
| `J`, `K`       | 基于屏幕行向下、向上跳转 5 行                            |
| `0`, `$`       | 普通模式下跳转到屏幕行的行首、行尾（可视模式下为实际行） |
| **保存与退出** |                                                          |
| `<leader>w`    | 保存                                                     |
| `<leader>q`    | 退出（未保存时会报错，不会退出）                         |
| `<leader>Q`    | 忽略改动并退出                                           |
| `<leader>W`    | 保存并退出                                               |
| **搜索**       |                                                          |
| `=`            | 跳转到下一个结果并使其居中于屏幕                         |
| `-`            | 跳转到上一个结果并使其居中于屏幕                         |
| `<leader><CR>` | 取消搜索结果高亮                                         |
| **分屏**       |                                                          |
| `<leader>sh`   | 向左新开一个分屏                                         |
| `<leader>sj`   | 向下新开一个分屏                                         |
| `<leader>sk`   | 向上新开一个分屏                                         |
| `<leader>sl`   | 向右新开一个分屏                                         |
| `<leader>h`    | 跳转到左侧分屏                                           |
| `<leader>j`    | 跳转到下面分屏                                           |
| `<leader>k`    | 跳转到上面分屏                                           |
| `<leader>l`    | 跳转到右侧分屏                                           |
| `<leader>H`    | 将当前分屏移动到最左侧                                   |
| `<leader>J`    | 将当前分屏移动到最底端                                   |
| `<leader>K`    | 将当前分屏移动到最顶端                                   |
| `<leader>L`    | 将当前分屏移动到最右侧                                   |
| `<c-up>`       | 增大分屏高度                                             |
| `<c-down>`     | 减小分屏高度                                             |
| `<c-right>`    | 增大分屏宽度                                             |
| `<c-left>`     | 减小分屏宽度                                             |
| **行移动**     |                                                          |
| `<a-j>`        | 把当前行下移一行                                         |
| `<a-k>`        | 把当前行上移一行                                         |
| **其他**       |                                                          |
| `<leader>o`    | 向下插入空行                                             |
| `<leader>O`    | 向上插入空行                                             |
| `<leader>F`    | 使用 LSP 格式化代码                                      |


## 插件配置

除了 [lazy.nvim](https://github.com/folke/lazy.nvim) 插件在 `init.lua` 文件中自动配置外，其他的插件都在 `lua/plugins/` 目录下。

[lazy.nvim] 重新映射了快捷键 `<leader>lz` 以快速打开插件菜单。

### Coding

`coding.lua` 的插件与编写代码的基本体验相关，主要是对 LSP 和补全系统进行配置。相关的插件和键盘映射有：

- [mason.nvim](https://github.com/williamboman/mason.nvim)：主要用于管理 LSP 的安装，可以使用 `:Mason` 查看已经安装的 LSP 等工具
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)：主要用于配置 LPS 的自动安装
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)：提供了多数 LSP 的默认配置
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)：根据 LSP 和代码片段提供自动补全功能，进一步有键盘映射：
    - `<tab>`：如果有多个补全项，向下选择
    - `<s-tab>`：如果有多个补全项，向上选择
    - `<c-j>`：如果有帮助文档，向下翻页
    - `<c-k>`：如果有帮助文档，向上翻页
    - `<c-e>`：取消补全
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)：自定义代码片段，具体可以查看根目录 `LuaSnip/` 路径下的配置

### Editor

`editor.lua` 内的插件用于给编辑器增加一些通用的功能，包括：

- [fcitx.nvim](https://github.com/h-hg/fcitx.nvim)：用于自动切换中英文输入法，这在使用 NeoVim 编写中文文档的时候非常有用
- [renamer.nvim](https://github.com/filipdutescu/renamer.nvim)：基于 LSP 增强变量重命名功能，并提供了一个简单的 UI 小窗口
    - `<F2>`：重命名当前光标下的变量
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)：智能注释，可以根据编程语言自动确定注释符
    - `<c-_>`：开关行注释
    - `<a-a>`：开关块注释
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)：自动补全定界符
- [tabular](https://github.com/godlygeek/tabular)：根据指定的符号将选定区域进行对齐
    - `<leader>a`：触发对齐功能，输入对齐位置的符号并回车后会自动对齐
- [nvim-surround](https://github.com/kylechui/nvim-surround)：自动处理周围的定界符，采用的是该插件默认的键位映射
    - `ys<motion><char>`：在 `<motion>` 指定范围周围添加与 `<char>` 匹配的定界符，例如 `ysiw(` 会在 `iw` 指定的当前字符周围添加由 `(` 指定的小括号对
    - `ds<char>`：删除光标周围由 `<char>` 指定的定界符，例如 `ds(` 会删除光变所在位置周围最内侧的小括号对
    - `dst`：删除光标周围的 HTML 标签
    - `cs<char1><char2>`：将周围由 `<char1>` 指定的定界符改为 `<char2>` 对应的定界符，例如 `cs(<` 会把光标周围最内侧的小括号对替换为尖括号对
    - 说明：上述命令中，如果 `<char>` 指定的是左定界符，命令处理后会确保内容与定界符之间保留一个空格；如果 `<char>` 指定的是右定界符，则会确保没有空格
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)：添加 Git 功能，添加了自定义键位
    - `<leader>gd`：查看当前位置的改动
    - `<leader>gj`：跳转到下一个改动位置
    - `<leader>gk`：跳转到上一个改动位置
    - `<leader>ga`：将光标当前位置的改动提交到暂存区
    - `<leader>gA`：将当前缓冲区的改动全部提交到暂存区
    - `<leader>gu`：撤销 “提交到暂存区” 的动作
    - `<leader>gb`：开关每行最后改动的提示
    - `<leader>gB`：查看上次提交的信息
- [flash.nvim](https://github.com/folke/flash.nvim)：强化的光标移动，采用了插件的推荐配置
    - `s`：触发跳转，此时窗口会变暗，输入待跳转位置的字符，然后输入对应位置紧接的第二个字符（根据情况，周围的字符可能会临时改变），就可以跳转过去
    - `S`：窗口变暗，给出提示字符，触发范围选择
    - `f`：触发向后搜索，输入字符后会高亮显示所有匹配字符，然后重复按 `f` 可以向下跳转，按 `F` 可以向上跳转
    - `F`：与 `f` 相似，只是触发向前搜索，连续按 `f` 可以向前连续跳转，按 `F` 可以向后跳转
    `t` 和 `T`：与 `f` 和 `F` 相似，只是向后或向前跳转到指定字符的前一个或后一个字符的位置
- [undotree](https://github.com/mbbill/undotree)：采用类似 Git 的方式记录文件的临时改动
    - `<leader>u`：打开侧边栏，显示编辑历史，可以选择、预览、回退到某个版本

### Writing

`writing.lua` 对 Markdown 和 LaTeX 编写进行了加强，主要插件有：

- [vimtex](https://github.com/lervag/vimtex)：极大提升使用 NeoVim 编辑 LaTeX 文档的体验，采用默认键位映射，常用的有：
    - `<localleader>li`：查看当前文档信息
    - `<localleader>lt`：打开目录
    - `<localleader>ll`：编译文档
    - `<localleader>lv`：打开编译后的文档
    - `<localleader>lc`：清理编译产生的临时文件
    - `<localleader>lC`：清理所有非必要文件
    - `dse`：删除周围环境
    - `dsc`：删除周围命令
    - `ds$`：删除行内数学
    - `dsd`：删除周围定界符
    - `cse`：更改周围环境
    - `csc`：更改当前命令
    - `cs$`：更改行内数学
    - `csd`：更改周围定界符
    - `tsc`：切换带星号的命令
    - `tse`：切换带星号的环境
    - `tsd`：切换周围定界符
    - `<F7>`：为选择的文本添加命令
    - `<F8>`：为周围定界符添加 `\left` 和 `\right`
- [vim-markdown](https://github.com/preservim/vim-markdown)：主要用到里面对 Markdown 文件数学环境的检查，以正确触发数学公式相关的代码片段
- [vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc）：自动生成各种风格的目录，并且在编辑过程中保持更新
    - `:GenTocGFM`：生成 GitHub Markdown 风格的目录
    - `:GenToc<type>`：其他 `<type>` 风格包括 `Redcarpet`、`GitLab`、`Marked`
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)：在浏览器预览 Markdown 文件
    - `<leader>mp`：开关 Markdown 预览功能

### UI

`ui.lua` 主要用于美化界面，多数插件没有绑定快捷键，但还是做一些简单的描述：

- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)：与 UI 相关的基础组件，其他插件的依赖项
- [nvim-notify](https://github.com/rcarriga/nvim-notify)：美化的通知栏，其他插件的依赖项
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)：图标支持，其他插件的依赖项
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)：一些基本函数，其他插件的依赖项
- [noice.nvim](https://github.com/folke/noice.nvim)：主要的 UI 美化插件
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)：配色方案
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)：底部状态栏
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)：缩进参考线
- [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)：直接在颜色或颜色代码底色显示对应的颜色
- [marks.nvim](https://github.com/chentoast/marks.nvim)：增强 NeoVim 的打标签功能，这里只记录常用键位
    - `m<char>`：用 `<char>` 标记当前行，可用于快速跳转
    - `dm<char>`：删除标签 `<char>`
    - `dm-`：删除当前行的标签
    - `dm<space>`：删除当前缓冲区的所有标签
    - `m]`：跳转到下一个标签位置
    - `m[`：跳转到上一个标签位置
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)：高亮注释中的 TODO、HACK、BUG 等关键字
- [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)：右侧的滑动条，支持鼠标拖动浏览文件
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)：编辑器顶部的标签管理，自定义了一些键位：
    - `tt`：触发跳转功能，选择标签中红色字符对因的按键即可跳转到对因缓冲区
    - `th`：跳转到左侧的缓冲区
    - `tl`：跳转到右侧的缓冲区
    - `tq`：触发关闭功能，选择标签中红色字符对因的按键即可关闭对应的缓冲区
    - `td`：退出当前的缓冲区
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)：目前主要用到它的高亮功能，也是部分插件的依赖
- [outline](https://github.com/hedyhli/outline.nvim)：用于显示代码结构，方便跳转
    - `<leader>r`：打开或关闭代码结构目录

### Explorer

`explorer.lua` 主要提供了文件和系统交互相关的功能：

- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)：侧边栏文件目录
    - `<leader>e`：打开或关闭文件浏览侧边栏
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)：快速文件预览和查找，简单地映射了几个快捷键
    - `<leader>ff`：根据文件名查找文件
    - `<leader>fg`：根据内容查找文件
    - `<leader>fb`：查找打开的缓冲区
    - `<leader>fh`：查找帮助文档
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)：内置终端功能
    - `<F4>`：打开或关闭内置终端
    - `<leader>r`：将当前行或选中的文本发送到终端



## 参考资料

[David Chen](https://github.com/theniceboy) （哔哩哔哩：[TheCW](https://space.bilibili.com/13081489/)）在哔哩哔哩上对 [Neo]Vim 的详细介绍和展示，这是促使我入坑的主要因素；配置初期也参考了他分享的配置文档。相关链接如下：

- [上古神器Vim：从恶言相向到爱不释手 - 终极Vim教程01 - 带你配置属于你自己的最强IDE](https://www.bilibili.com/video/BV164411P7tw)
- [上古神器Vim：进阶使用/配置、必备插件介绍 - 终极Vim教程02 - 带你配置属于你自己的最强IDE](https://www.bilibili.com/video/BV1e4411V7AA)
- [「妈妈不会告诉你的Vim技巧」 -Vim终极教程03 - 带你配置属于你自己的最强IDE](https://www.bilibili.com/video/BV1r4411G7de)
- [21世纪最强代码编辑器：NeoVim ——就是这些设置让它变成了编辑器之鬼 【附配置与插件教程】](https://www.bilibili.com/video/BV1y4411C7pE)
- [【硬货】让你的vim像vscode一样强大 —— coc.nvim终极指南](https://www.bilibili.com/video/BV1Ka4y1E7AM)
- [Colemak 用户使用的 NeoVim 配置文件](https://github.com/theniceboy/nvim)

[Elijan Mastnak](https://github.com/ejmastnak) 分享了详细的关于使用 NeoVim 编辑 LaTeX 的系列文章，极大改善了 LaTeX 文档编写体检。相关链接如下：

- [Supercharged LaTeX using (Neo)Vim, VimTeX, and snippets](https://www.ejmastnak.com/tutorials/vim-latex/intro/)
- [1. Suggested Prerequisites for Writing LaTeX in Vim](https://www.ejmastnak.com/tutorials/vim-latex/prerequisites/)
- [2. An UltiSnips guide for LaTeX workflows](https://www.ejmastnak.com/tutorials/vim-latex/ultisnips/)
- [2. A LuaSnip guide for LaTeX workflows](https://www.ejmastnak.com/tutorials/vim-latex/luasnip/)
- [3. Vim’s `ftplugin` system](https://www.ejmastnak.com/tutorials/vim-latex/ftplugin/)
- [4. Getting started with the VimTeX plugin](https://www.ejmastnak.com/tutorials/vim-latex/vimtex/)
- [5. Compiling LaTeX Documents in a Vim-Based Workflow](https://www.ejmastnak.com/tutorials/vim-latex/compilation/)
- [6. Setting Up a PDF Reader for Writing LaTeX with Vim](https://www.ejmastnak.com/tutorials/vim-latex/pdf-reader/)
- [7. A Vimscript Primer for Filetype-Specific Workflows](https://www.ejmastnak.com/tutorials/vim-latex/vimscript/)

[Dave Lage](https://github.com/rockerBOO) 的 [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) 收集了很多优秀的插件，并经常更新，有新需求不妨先在这个仓库看看。

