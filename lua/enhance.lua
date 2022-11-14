local map = vim.keymap.set

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
map('n', '<leader>u', '<cmd>UndotreeToggle<CR>')


------------------------------------------
-- sniprun
------------------------------------------
require('sniprun').setup({
    display = { "NvimNotify" },
})
map('', '<F9>', '<Plug>SnipRun', { silent = true })
map('', '<F5>', 'ggVG<cmd>SnipRun<CR><c-o>', { silent = true })


------------------------------------------
-- nvim-tree
------------------------------------------
require("nvim-tree").setup()
map('', '<leader>e', '<cmd>NvimTreeToggle<CR>', { silent = true })


------------------------------------------
-- bufferline
------------------------------------------
require("bufferline").setup {
    options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        always_show_bufferline = false,
    }
}
map('', 'tt', '<cmd>BufferLinePick<CR>', { silent = true })
map('', 'th', '<cmd>BufferLineCyclePrev<CR>', { silent = true })
map('', 'tl', '<cmd>BufferLineCycleNext<CR>', { silent = true })
map('', 'tq', '<cmd>BufferLinePickClose<CR>', { silent = true })
map('', 'td', '<cmd>Bdelete<CR>', { silent = true })


------------------------------------------
-- telescope
------------------------------------------
require("telescope").load_extension('command_center')
map('', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('', '<leader>fc', '<cmd>Telescope command_center<cr>')


------------------------------------------
-- toggleterm
------------------------------------------
require('toggleterm').setup({
    open_mapping = '<F4>',
    direction = 'horizontal', -- 'float'
    float_opts = {
        border = 'curved'
    }
})
map('t', '<esc>', '<C-\\><C-n>')
map('n', '<leader>t', ':ToggleTerm direction=horizontal<CR>', { silent = true })
map('n', '<leader>T', ':ToggleTerm direction=float<CR>', { silent = true })
map('n', '<leader>r', ':ToggleTermSendCurrentLine<CR>', { silent = true })
map('v', '<leader>r', ':ToggleTermSendVisualSelection<CR>', { silent = true })


------------------------------------------
-- persisted.nvim
------------------------------------------
require("persisted").setup({
    use_git_branch = true,
})
require("telescope").load_extension("persisted") -- To load the telescope extension
map('','<leader>fs','<cmd>Telescope persisted<cr>')
