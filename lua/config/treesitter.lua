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
