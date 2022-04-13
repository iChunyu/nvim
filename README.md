# 我的 NeoVim 配置

## 安装

- 安装 NeoVim

```
sudo pacman -S neovim python-pynvim
```

- 插件管理 [`vim-plug`](https://github.com/junegunn/vim-plug)

```
# 从 AUR 安装
yay -S vim-plug
# 从 GitHub 安装
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

- 使用系统剪切板

```
sudo pacman -S xclip
```

- Powerline 字体

```
sudo pacman -S powerline-fonts
```


## 配置

### 自动安装插件

使用命令 `nvim` 进入 NeoVim 后，输入 `:PlugInstall` 即可自动安装插件。

### Python 3 设置

Python 3 路径设置为 `/usr/bin/python`，应当不需要变更。如果使用其他发行版而导致路径不同，再修改此设置。

### AirLine

安装字体即可。

### VimTex

安装 `zathura` 阅读器。

```
sudo pacman -S zathura zathura-pdf-poppler
```


