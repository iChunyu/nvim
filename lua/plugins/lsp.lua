return {

    -- Portable package manager for Neovim
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },

    -- Brige `mason.nvim` with `lspconfig` plugin
    { 'williamboman/mason-lspconfig.nvim', opts = { automatic_installation = true } },

    -- Quickstart configs for Nvim LSP
    {
        'neovim/nvim-lspconfig',
        config = function()
            -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require('lspconfig')
            local servers = { 'ltex', 'texlab', 'pyright', 'lua_ls', 'marksman' }
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities,
                }
            end
        end
    },

    -- A completion plugin for neovim coded in Lua
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
            'hrsh7th/cmp-path',     -- Enable filesystem path autocompletion
            'hrsh7th/cmp-emoji',    -- Enable emoji autocompletion
            'hrsh7th/cmp-cmdline'   -- Enable command line autocompletion
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-k>'] = cmp.mapping.scroll_docs(-10),
                    ['<C-j>'] = cmp.mapping.scroll_docs(10),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    -- Accept currently selected item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        else
                            fallback()
                            -- Disable <Tab> expand, reserved for indent
                            -- require("cmp_nvim_ultisnips.mappings").expand_or_jump_forwards(fallback)
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        else
                            fallback()
                            -- require("cmp_nvim_ultisnips.mappings").jump_backwards(fallback)
                        end
                    end, { 'i', 's' }),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'emoji' },
                    -- { name = 'luasnip' }, -- For luasnip users.
                }
            })
            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    },

    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    -- {
    --     'jose-elias-alvarez/null-ls.nvim',
    --     opts = {
    --         sources = {
    --             -- dependency: `:MasonInstall markdownlint`
    --             null_ls.builtins.diagnostics.markdownlint,
    --             null_ls.builtins.formatting.markdownlint,
    --         }
    --     }
    -- }

}
