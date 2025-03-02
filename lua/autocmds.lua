-- automatically remove triling whitespaces
vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    {
        pattern = { "*" },
        command = [[%s/\s\+$//e]],
    }
)
