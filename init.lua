-- This is the entrance file for neovim configuration.
-- Detailed configurations are in `./lua/` folder and call by `require` function below.

-- `./lua/settings.lua` collects basic settings
require('settings')

-- `.lua/keymaps.lua` changes and adds key mappings without any plugin
require('keymaps')


-- [Bootstrap] Use `lazy.nvim` to manage plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Configure `lazy.nvim` and plugins
require("lazy").setup("plugins")


-- Custom 'hover' keys (overwrite default map 'K')
-- Ref: https://github.com/folke/lazy.nvim/issues/73#issuecomment-1364301358
local ViewConfig = require("lazy.view.config")
ViewConfig.keys.hover = "<c-k>"

local map = vim.keymap.set
map('n','<leader>lz','<cmd>Lazy<cr><cmd>set cursorline<cr>',{silent=true})
