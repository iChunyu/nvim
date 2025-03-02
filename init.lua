-- This is the entrance file for neovim configuration.
-- Detailed configurations are in `./lua/` folder and call by `require` function below.

-- `./lua/settings.lua` collects basic settings
require('settings')

-- `.lua/keymaps.lua` changes and adds key mappings without any plugin
require('keymaps')

require('autocmds')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Configure `lazy.nvim` and plugins
require("lazy").setup("plugins")


-- Custom 'hover' keys (overwrite default map 'K')
-- Ref: https://github.com/folke/lazy.nvim/issues/73#issuecomment-1364301358
local ViewConfig = require("lazy.view.config")
ViewConfig.keys.hover = "<c-k>"

local map = vim.keymap.set
map('n', '<leader>lz', '<cmd>Lazy<cr><cmd>set cursorline<cr>', { silent = true })
