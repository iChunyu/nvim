local lsp_servers = { 'lua_ls', 'pyright', 'marksman', 'clangd', 'lemminx' }

return
{
    -- LPS server manager
    {
        'williamboman/mason.nvim',
        build = ":MasonUpdate", -- update registry contents
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

    -- Automatic install LPS servers
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            automatic_installation = true,
            ensure_installed = lsp_servers
        }
    },

    -- LSP configrations
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'hrsh7th/cmp-nvim-lsp' },
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            for _, lsp in ipairs(lsp_servers) do
                lspconfig[lsp].setup { capabilities = capabilities }
            end
        end
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',    -- LSP source for nvim-cmp
            'hrsh7th/cmp-path',        -- Enable filesystem path autocompletion
            'hrsh7th/cmp-emoji',       -- Enable emoji autocompletion
            'hrsh7th/cmp-cmdline',     -- Enable command line autocompletion
            'L3MON4D3/LuaSnip',        -- Luasnip engine
            'saadparwaiz1/cmp_luasnip' -- Luasnip source for nvim-cmp
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
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
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'emoji' },
                    { name = 'luasnip' }
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
                    { name = 'path' },
                    { name = 'cmdline' }
                })
            })
        end
    },

    -- Snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "*",
        build = "make install_jsregexp", -- install jsregexp (optional!).
        config = function()
            require("luasnip").config.set_config({
                -- Enable autotriggered snippets
                enable_autosnippets = true,
                -- Use Tab (or some other key if you prefer) to trigger visual selection
                store_selection_keys = "<C-j>",
                -- Update text in the repeated node
                update_events = 'TextChanged,TextChangedI'
            })
            require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })
        end
    },

    -- GitHub Copilot
    {
        "github/copilot.vim"
    }
}
