require('gitsigns').setup{
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                opts.silent = true
                vim.keymap.set(mode, l, r, opts)
            end

        -- Keymap
        map('', '<leader>gd', gs.preview_hunk)
        map('', '<leader>gj', gs.next_hunk)
        map('', '<leader>gk', gs.prev_hunk)
        map('', '<leader>ga', gs.stage_hunk)
        map('', '<leader>gu', gs.undo_stage_hunk)
        map('', '<leader>gb', gs.toggle_current_line_blame)
        map('', '<leader>gB', function() gs.blame_line{full = true} end)
    end
}

