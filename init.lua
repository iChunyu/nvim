-- This is the entrance file for neovim configuration.
-- Detailed configurations are in `./lua/` folder and call by `require` function below.

-- `./lua/settings.lua` collects basic settings
require('settings')

-- `.lua/keymaps.lua` changes and adds key mappings without any plugin
require('keymaps')

-- `./lua/plugins.lua` collects plugins and perform auto-installation
require('plugins')

-- './lua/lsp.lua' configurates LSP, autocompletion etc.
require('lsp')

-- './lua/enhance.lua' sets plugins to enhance Neovim
require('enhance')

-- './lua/marktex.lua' specially concerntrates on Markdown/LaTeX config
require('marktex')

-- './lua/editing.lua' collects preferences for common editing
require('editing')

-- './lua/beautify.lua' beautifies Neovim
require('beautify')
