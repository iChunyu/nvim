-- This is the entrance file for neovim configuration.
-- Detailed configurations are in `./lua/` folder and call by `require` function below.

-- `./lua/settings.lua` collects basic settings
require('settings')

-- `.lua/keymaps.lua` changes and adds key mappings without any plugin
require('keymaps')

-- `./lua/plugins.lua` configurates plugins
-- Detailed configurations for plugins are located in `./lua/config/`
-- (For the sake of simplification, plugins settings are grouped in 'sections')
require('plugins')
