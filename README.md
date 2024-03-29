# 某春雨自用的 NeoVim 配置


本仓库是我自用的 NeoVim 配置，使用 Lua 进行配置。

> 基于 VimScript 的最后一次配置在 [`e50327e`](https://github.com/iChunyu/nvim/tree/e50327e0e759bac2c6d4408fec2a89fba192cada) 提交处，相应的配置说明写在我的博客 [NeoVim 基本配置](https://ichunyu.github.io/neovim/) 中，有需要的小伙伴请自行移步。:warning: VimScript 的配置与当前 Lua 的配置不同。


## 目录

<!-- TOC GFM -->

- [安装前的准备](#安装前的准备)
- [基本键位映射](#基本键位映射)
- [插件键位映射](#插件键位映射)
- [参考与致谢](#参考与致谢)

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
| `sh`           | 向左新开一个分屏                                         |
| `sj`           | 向下新开一个分屏                                         |
| `sk`           | 向上新开一个分屏                                         |
| `sl`           | 向右新开一个分屏                                         |
| `<leader>h`    | 跳转到左侧分屏                                           |
| `<leader>j`    | 跳转到下面分屏                                           |
| `<leader>k`    | 跳转到上面分屏                                           |
| `<leader>l`    | 跳转到右侧分屏                                           |
| `<leader>H`    | 将当前分屏移动到最左侧                                   |
| `<leader>J`    | 将当前分屏移动到最底端                                   |
| `<leader>K`    | 将当前分屏移动到最顶端                                   |
| `<leader>L`    | 将当前分屏移动到最右侧                                   |
| `<up>`         | 增大分屏高度                                             |
| `<down>`       | 减小分屏高度                                             |
| `<right>`      | 增大分屏宽度                                             |
| `<left>`       | 减小分屏宽度                                             |
| **标签**       |                                                          |
| `Ta`           | 新开一个标签页                                           |
| `Th`           | 跳转到左侧标签页                                         |
| `Tl`           | 跳转到右侧标签页                                         |
| **其他**       |                                                          |
| `<leader>o`    | 向下插入空行                                             |
| `<leader>O`    | 向上插入空行                                             |
| `<leader>F`    | 使用 LSP 格式化代码                                      |


## 插件键位映射

本配置文件所涉及相关插件的键位映射和基本用法如下表所示。

| 键                   | 说明                                                                 |
| :---                 | :---                                                                 |
| **Lazy**             |                                                                      |
| `<leader>lz`         | 查看插件                                                             |
| **LSP**              |                                                                      |
| `<ctrl>j`            | 向上翻阅帮助文档                                                     |
| `<ctrl>k`            | 向下翻阅帮助文档                                                     |
| **gitsigns**         |                                                                      |
| `<leader>gd`         | 查看当前位置改动                                                     |
| `<leader>gj`         | 跳转到下一处改动                                                     |
| `<leader>gk`         | 跳转到上一处改动                                                     |
| `<leader>ga`         | 将当前位置的改动添加到暂存区                                         |
| `<leader>gA`         | 将当前文件的改动添加到暂存区                                         |
| `<leader>gu`         | 将当前位置的改动从暂存区内撤销                                       |
| `<leader>gb`         | 查看当前位置的提交信息                                               |
| `<leader>gB`         | 查看上一次提交信息                                                   |
| **lightspeed**       |                                                                      |
| `L`                  | 向后查找并跳转：输入关键字符后自动跳转（临时替换字符以确保跳转唯一） |
| `H`                  | 向前查找并跳转（同上）                                               |
| **undotree**         |                                                                      |
| `<leader>u`          | 打开改动历史：结合分屏跳转、选中历史节点后可以回滚                   |
| **luasnip**          |                                                                      |
| `<ctrl>j`            | 手动展开代码片段、跳转到下一个断点                                   |
| `<ctrl>k`            | 跳转到上一个断点                                                     |
| **vimtex**           |                                                                      |
| `<localleader>li`    | 查看当前文档信息                                                     |
| `<localleader>lt`    | 打开目录                                                             |
| `<localleader>ll`    | 编译文档                                                             |
| `<localleader>lv`    | 打开编译后的文档                                                     |
| `<localleader>lc`    | 清理编译产生的临时文件                                               |
| `<localleader>lC`    | 清理所有非必要文件                                                   |
| `dse`                | 删除周围环境                                                         |
| `dsc`                | 删除周围命令                                                         |
| `ds$`                | 删除行内数学                                                         |
| `dsd`                | 删除周围定界符                                                       |
| `cse`                | 更改周围环境                                                         |
| `csc`                | 更改当前命令                                                         |
| `cs$`                | 更改行内数学                                                         |
| `csd`                | 更改周围定界符                                                       |
| `tsc`                | 切换带星号的命令                                                     |
| `tse`                | 切换带星号的环境                                                     |
| `tsd`                | 切换周围定界符                                                       |
| `<F7>`               | 为选择的文本添加命令                                                 |
| `<F8>`               | 为周围定界符添加 `\left` 和 `\right`                                 |
| **vim-markdown-toc** |                                                                      |
| `:GenTocGFM<CR>`     | 在当前位置插入 GitHub 风格的目录，并自动更新（未映射新键位）         |
| **markdown-preview** |                                                                      |
| `<leader>mp`         | 打开/关闭预览                                                        |
| **comment**          |                                                                      |
| `<ctrl>/`            | 注释当前行或注释选中代码                                             |
| **tabular**          |                                                                      |
| `<leader>a`          | 将选中内容依据给定符号对齐：先选中文本，触发后给定符号并回车即可     |
| **nvim-tree**        |                                                                      |
| `<leader>e`          | 打开文件浏览器                                                       |
| **bufferline**       |                                                                      |
| `tt`                 | 根据标签页提示字符选择标签页                                         |
| `th`                 | 跳转到左侧标签页                                                     |
| `tl`                 | 跳转到右侧标签页                                                     |
| `tq`                 | 根据标签页提示字符关闭标签页（不保存修改）                           |
| `td`                 | 关闭当前标签页                                                       |
| **telescope**        |                                                                      |
| `<leader>ff`         | 查找文件                                                             |
| `<leader>fg`         | 查找关键字                                                           |
| `<leader>fb`         | 查找打开的缓冲区                                                     |
| `<leader>fh`         | 查找帮助文档                                                         |
| **renamer**          |                                                                      |
| `<F2>`               | 批量重命名变量                                                       |
| **toggleterm**       |                                                                      |
| `<F4>`               | 打开、关闭终端（默认为底部终端）                                     |
| `<leader>r`          | 将当前行或所选内容发送到终端并执行                                   |
| **trouble**          |                                                                      |
| `<leader>t`          | 检查并预览当前文件的错误和警告                                       |




## 参考与致谢

特别感谢 [David Chen](https://github.com/theniceboy) （哔哩哔哩：[TheCW](https://space.bilibili.com/13081489/)）在哔哩哔哩上对 [Neo]Vim 的详细介绍和展示，这是促使我入坑的主要因素；同时也感谢他分享的配置文档。相关链接如下：

- [上古神器Vim：从恶言相向到爱不释手 - 终极Vim教程01 - 带你配置属于你自己的最强IDE](https://www.bilibili.com/video/BV164411P7tw)
- [上古神器Vim：进阶使用/配置、必备插件介绍 - 终极Vim教程02 - 带你配置属于你自己的最强IDE](https://www.bilibili.com/video/BV1e4411V7AA)
- [「妈妈不会告诉你的Vim技巧」 -Vim终极教程03 - 带你配置属于你自己的最强IDE](https://www.bilibili.com/video/BV1r4411G7de)
- [21世纪最强代码编辑器：NeoVim ——就是这些设置让它变成了编辑器之鬼 【附配置与插件教程】](https://www.bilibili.com/video/BV1y4411C7pE)
- [【硬货】让你的vim像vscode一样强大 —— coc.nvim终极指南](https://www.bilibili.com/video/BV1Ka4y1E7AM)
- [Colemak 用户使用的 NeoVim 配置文件](https://github.com/theniceboy/nvim)

非常感谢 [Elijan Mastnak](https://github.com/ejmastnak) 关于使用 NeoVim 编辑 LaTeX 的系列文章，这为我配置 VimTeX 时提供了重要的参考。相关链接如下：

- [Supercharged LaTeX using (Neo)Vim, VimTeX, and snippets](https://www.ejmastnak.com/tutorials/vim-latex/intro/)
- [1. Suggested Prerequisites for Writing LaTeX in Vim](https://www.ejmastnak.com/tutorials/vim-latex/prerequisites/)
- [2. An UltiSnips guide for LaTeX workflows](https://www.ejmastnak.com/tutorials/vim-latex/ultisnips/)
- [2. A LuaSnip guide for LaTeX workflows](https://www.ejmastnak.com/tutorials/vim-latex/luasnip/)
- [3. Vim’s `ftplugin` system](https://www.ejmastnak.com/tutorials/vim-latex/ftplugin/)
- [4. Getting started with the VimTeX plugin](https://www.ejmastnak.com/tutorials/vim-latex/vimtex/)
- [5. Compiling LaTeX Documents in a Vim-Based Workflow](https://www.ejmastnak.com/tutorials/vim-latex/compilation/)
- [6. Setting Up a PDF Reader for Writing LaTeX with Vim](https://www.ejmastnak.com/tutorials/vim-latex/pdf-reader/)
- [7. A Vimscript Primer for Filetype-Specific Workflows](https://www.ejmastnak.com/tutorials/vim-latex/vimscript/)

[Dave Lage](https://github.com/rockerBOO) 的 [awesome-neovim](https://github.com/rockerBOO/awesome-neovim) 为本配置使用的插件提供了参考。

