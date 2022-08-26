local map = vim.keymap.set

------------------------------------------
-- treesitter and rainbow
------------------------------------------
require('nvim-treesitter.configs').setup {
    -- one of "all", "language", or a list of languages
    -- Do NOT add 'latex' and 'markdown' for now, breaking `vimtex#syntax#in_mathzone`
    -- Ref: https://github.com/nvim-treesitter/nvim-treesitter/issues/1184
    ensure_installed = { 'bibtex', 'python', 'vim', 'lua', 'cpp' },
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    rainbow = {
        enable = true,
        -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        extended_mode = true,
    },
}


------------------------------------------
-- gitsigns
------------------------------------------
require('gitsigns').setup {
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function gitmap(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            opts.silent = true
            vim.keymap.set(mode, l, r, opts)
        end

        -- Keymap
        gitmap('', '<leader>gd', gs.preview_hunk)
        gitmap('', '<leader>gj', gs.next_hunk)
        gitmap('', '<leader>gk', gs.prev_hunk)
        gitmap('', '<leader>ga', gs.stage_hunk)
        gitmap('', '<leader>gu', gs.undo_stage_hunk)
        gitmap('', '<leader>gb', gs.toggle_current_line_blame)
        gitmap('', '<leader>gB', function() gs.blame_line { full = true } end)
    end
}


------------------------------------------
-- lightspeed
------------------------------------------
require('lightspeed').setup {}
map('', 'L', '<Plug>Lightspeed_s')
map('', 'H', '<Plug>Lightspeed_S')


------------------------------------------
-- undotree
------------------------------------------
map('n', '<leader>u', ':UndotreeToggle<CR>')


------------------------------------------
-- sniprun
------------------------------------------
require('sniprun').setup({
    display = { "NvimNotify" },
})
map('', '<F9>', '<Plug>SnipRun', { silent = true })
map('', '<F5>', 'ggVG:SnipRun<CR><c-o>', { silent = true })


------------------------------------------
-- nvim-tree
------------------------------------------
require("nvim-tree").setup()
map('', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })


------------------------------------------
-- bufferline
------------------------------------------
require("bufferline").setup()
map('', 'tt', ':BufferLinePick<CR>', { silent = true })
map('', 'th', ':BufferLineCyclePrev<CR>', { silent = true })
map('', 'tl', ':BufferLineCycleNext<CR>', { silent = true })
map('', 'tq', ':BufferLinePickClose<CR>', { silent = true })


------------------------------------------
-- telescope
------------------------------------------
map('', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('', '<leader>fh', '<cmd>Telescope help_tags<cr>')


------------------------------------------
-- which-key
------------------------------------------
require('which-key').setup {}
