# 某春雨自用的 NeoVim 配置

<!-- TOC GFM -->

* [## 使用前的准备](#-使用前的准备)
* [## 使用方法](#-使用方法)
* [## 配置说明](#-配置说明)
* [## 插件简介](#-插件简介)
* [## 致谢](#-致谢)
* [## 参考资料](#-参考资料)

<!-- /TOC -->

## 使用前的准备
---

在使用本配置前，请确保已经安装：

- [NeoVim](https://neovim.io/) 及其必要依赖；
- [vim-plug](https://github.com/junegunn/vim-plug) 插件管理器；

以下内容可选，用于增强功能和美化：

- [xclip](https://github.com/astrand/xclip)：启用 `+` 寄存器用于系统级复制；
- [powerline-fonts](https://github.com/powerline/powerline)：用于 `airline` 插件美化。

如果你是 Arch 用户，上述基本配置可以使用 `yay` 进行安装：

``` bash
yay -S neovim python-pynvim     # NeoVim 和 Python 依赖
yay -S vim-plug                 # 插件管理器
yay -S xclip powerline-fonts    # [可选] 系统剪切板和美化字体
```

## 使用方法
---

将本仓库克隆到用户配置文件夹下，对于 Linux 用户，可使用以下命令：

``` bash
git clone https://github.com/iChunyu/nvim.git ~/.config/nvim/
```

进入 NeoVim 后运行 `:PlugInstall` 等待插件安装完成即可。

## 配置说明
---


## 插件简介
---

## 致谢
---

（草稿还没完成，但致谢必须写上：感谢 [theniceboy](https://github.com/theniceboy) 的 B 站视频和配置示例！）

## 参考资料
---
