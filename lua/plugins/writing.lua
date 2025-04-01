local map = vim.keymap.set

return {
    -- LaTeX support
    {
        'lervag/vimtex',
        lazy = false,
        init = function()
            vim.g['vimtex_view_method'] = 'zathura'
            vim.g['vimtex_quickfix_open_on_warning'] = 0
            vim.g['vimtex_compiler_latexmk_engines'] = {
                _        = '-xelatex',
                pdfdvi   = '-pdfdvi',
                pdfps    = '-pdfps',
                pdflatex = '-pdf',
                luatex   = '-lualatex',
                lualatex = '-lualatex',
                xelatex  = '-xelatex',
            }
        end
    },

    -- Enable `vimtex#syntax#in_mathzone` in markdown
    {
        'preservim/vim-markdown',
        init = function()
            vim.g['vim_markdown_math'] = 1
            vim.g['vim_markdown_folding_disabled'] = 1
        end
    },

    -- Autogenerate table of contents
    {
        'mzlogin/vim-markdown-toc',
        init = function()
            vim.g['vmt_list_item_char'] = '-'
            vim.g['vmt_fence_text'] = 'TOC'
            vim.g['vmt_fence_closing_text'] = '/TOC'
        end
    },

    -- Markdown live preview
    {
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        ft = { "markdown" },
        keys = {
            { '<leader>mp', '<Plug>MarkdownPreviewToggle', 'n', desc = 'Toggle Markdown Preview', { silent = true } }
        }
    },

    -- Obsidian support
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        dependencies = { "nvim-lua/plenary.nvim", },
        opts = {
            workspaces = {
                {
                    name = "Notes",
                    path = "~/Notes",
                },
            },
            daily_notes = {
                -- Optional, if you keep daily notes in a separate directory.
                folder = "DailyNotes",
                -- Optional, if you want to change the date format for the ID of daily notes.
                date_format = "%Y-%m-%d",
                -- Optional, if you want to change the date format of the default alias of daily notes.
                alias_format = "%B %-d, %Y",
                -- Optional, default tags to add to each new daily note created.
                default_tags = { "daily-notes" },
                -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                template = nil
            },
        },
    }
}
