local map = vim.keymap.set
local cmd = require('command_center')

------------------------------------------
-- gitsigns
------------------------------------------
require('gitsigns').setup {}
-- on_attach = function(bufnr)
--     local gs = package.loaded.gitsigns
--
--     local function gitmap(mode, l, r, opts)
--         opts = opts or {}
--         opts.buffer = bufnr
--         opts.silent = true
--         vim.keymap.set(mode, l, r, opts)
--     end
--
--     -- Keymap
--     gitmap('', '<leader>gd', gs.preview_hunk)
--     gitmap('', '<leader>gj', gs.next_hunk)
--     gitmap('', '<leader>gk', gs.prev_hunk)
--     gitmap('', '<leader>ga', gs.stage_hunk)
--     gitmap('', '<leader>gu', gs.undo_stage_hunk)
--     gitmap('', '<leader>gb', gs.toggle_current_line_blame)
--     gitmap('', '<leader>gB', function() gs.blame_line { full = true } end)
-- end
-- }
cmd.add({
    {
        desc = 'Preview hunk',
        cmd = '<cmd>Gitsigns preview_hunk<cr>',
        keys = { 'n', '<leader>gd' },
        category = 'gitsigns'
    }, {
        desc = 'Next hunk',
        cmd = '<cmd>Gitsigns next_hunk<cr>',
        keys = { 'n', '<leader>gj' },
        category = 'gitsigns'
    }, {
        desc = 'Previous hunk',
        cmd = '<cmd>Gitsigns prev_hunk<cr>',
        keys = { 'n', '<leader>gk' },
        category = 'gitsigns'
    }, {
        desc = 'Stage hunk',
        cmd = '<cmd>Gitsigns stage_hunk<cr>',
        keys = { 'n', '<leader>ga' },
        category = 'gitsigns'
    }, {
        desc = 'Undo stage hunk',
        cmd = '<cmd>Gitsigns undo_stage_hunk<cr>',
        keys = { 'n', '<leader>gu' },
        category = 'gitsigns'
    }, {
        desc = 'Toggle current line blame',
        cmd = '<cmd>Gitsigns toggle_current_line_blame<cr>',
        keys = { 'n', '<leader>gb' },
        category = 'gitsigns'
    }, {
        desc = 'Show blame line',
        cmd = '<cmd>Gitsigns blame_line<cr>',
        keys = { 'n', '<leader>gB' },
        category = 'gitsigns'
    }
})


------------------------------------------
-- lightspeed
------------------------------------------
require('lightspeed').setup {}
-- map('', 'L', '<Plug>Lightspeed_s')
-- map('', 'H', '<Plug>Lightspeed_S')
cmd.add({
    {
        desc = 'Jump forward',
        cmd = '<Plug>Lightspeed_s',
        keys = { 'n', 'L' },
        category = 'lightspeed'

    }, {
        desc = 'Jump backward',
        cmd = '<Plug>Lightspeed_S',
        keys = { 'n', 'H' },
        category = 'lightspeed'
    }
})


------------------------------------------
-- undotree
------------------------------------------
-- map('n', '<leader>u', '<cmd>UndotreeToggle<CR>')
cmd.add({
    {
        desc = 'Toggle undo tree',
        cmd = '<cmd>UndotreeToggle<cr>',
        keys = { 'n', '<leader>u' },
        category = 'undotree'
    }
})


------------------------------------------
-- sniprun
------------------------------------------
require('sniprun').setup({
    display = { "NvimNotify" },
})
-- map('', '<F9>', '<Plug>SnipRun', { silent = true })
-- map('', '<F5>', 'ggVG<cmd>SnipRun<CR><c-o>', { silent = true })
cmd.add({
    {
        desc = 'Run snippet',
        cmd = '<Plug>SnipRun',
        keys = {
            { 'n', '<F9>', { slient = true } },
            { 'v', '<F9>', { slient = true } }
        },
        category = 'sniprun'
    }
})


------------------------------------------
-- nvim-tree
------------------------------------------
require("nvim-tree").setup()
-- map('', '<leader>e', '<cmd>NvimTreeToggle<CR>', { silent = true })
cmd.add({
    {
        desc = 'Toggle file tree',
        cmd = '<cmd>NvimTreeToggle<cr>',
        keys = { 'n', '<leader>e', { slient = true } },
        category = 'nvim-tree'
    }
})


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
-- map('', 'tt', '<cmd>BufferLinePick<CR>', { silent = true })
-- map('', 'th', '<cmd>BufferLineCyclePrev<CR>', { silent = true })
-- map('', 'tl', '<cmd>BufferLineCycleNext<CR>', { silent = true })
-- map('', 'tq', '<cmd>BufferLinePickClose<CR>', { silent = true })
-- map('', 'td', '<cmd>Bdelete<CR>', { silent = true })
cmd.add({
    {
        desc = 'Pick buffer',
        cmd = '<cmd>BufferLinePick<cr>',
        keys = { 'n', 'tt', { silent = true } },
        category = 'bufferline'
    }, {
        desc = 'Previous buffer',
        cmd = '<cmd>BufferLineCyclePrev<cr>',
        keys = { 'n', 'th', { silent = true } },
        category = 'bufferline'
    }, {
        desc = 'Next buffer',
        cmd = '<cmd>BufferLineCycleNext<cr>',
        keys = { 'n', 'tl', { silent = true } },
        category = 'bufferline'
    }, {
        desc = 'Close picked buffer',
        cmd = '<cmd>BufferLinePickClose<cr>',
        keys = { 'n', 'tq', { silent = true } },
        category = 'bufferline'
    }, {
        desc = 'Close current buffer',
        cmd = '<cmd>Bdelete<cr>',
        keys = { 'n', 'td', { silent = true } },
        category = 'bufferline'
    }
})


------------------------------------------
-- telescope
------------------------------------------
require("telescope").load_extension('command_center')
-- map('', '<leader>ff', '<cmd>Telescope find_files<cr>')
-- map('', '<leader>fg', '<cmd>Telescope live_grep<cr>')
-- map('', '<leader>fb', '<cmd>Telescope buffers<cr>')
-- map('', '<leader>fh', '<cmd>Telescope help_tags<cr>')
-- map('', '<leader>fc', '<cmd>Telescope command_center<cr>')
cmd.add({
    {
        desc = 'Find file',
        cmd = '<cmd>Telescope find_files<cr>',
        keys = { 'n', '<leader>ff' },
        category = 'telescope'
    }, {
        desc = 'Live grep',
        cmd = '<cmd>Telescope live_grep<cr>',
        keys = { 'n', '<leader>fg' },
        category = 'telescope'
    }, {
        desc = 'Find in buffer',
        cmd = '<cmd>Telescope buffers<cr>',
        keys = { 'n', '<leader>fb' },
        category = 'telescope'
    }, {
        desc = 'Find help',
        cmd = '<cmd>Telescope help_tags<cr>',
        keys = { 'n', '<leader>fh' },
        category = 'telescope'
    }, {
        desc = 'Find command',
        cmd = '<cmd>Telescope command_center<cr>',
        keys = { 'n', '<leader>fc' },
        category = 'telescope'
    }
})


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
-- map('n', '<leader>t', '<cmd>ToggleTerm direction=horizontal<CR>')
-- map('n', '<leader>T', '<cmd>ToggleTerm direction=float<CR>')
-- map('n', '<leader>r', '<cmd>ToggleTermSendCurrentLine<CR>')
-- map('v', '<leader>r', '<cmd>ToggleTermSendVisualSelection<CR>')
cmd.add({
    {
        desc = 'Toggle horizontal terminal',
        cmd = '<cmd>ToggleTerm direction=horizontal<cr>',
        keys = { 'n', '<leader>t' },
        category = 'toggleterm'
    }, {
        desc = 'Toggle float terminal',
        cmd = '<cmd>ToggleTerm direction=float<cr>',
        keys = { 'n', '<leader>T' },
        category = 'toggleterm'
    }, {
        desc = 'Send current line to terminal',
        cmd = '<cmd>ToggleTermSendCurrentLine<cr>',
        keys = { 'n', '<leader>r' },
        category = 'toggleterm'
    }, {
        desc = 'Send selection to terminal',
        cmd = '<cmd>ToggleTermSendVisualSelection<cr>',
        keys = { 'v', '<leader>r' },
        category = 'toggleterm'
    }
})
