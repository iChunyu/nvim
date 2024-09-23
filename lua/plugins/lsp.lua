-- Untisnip settings: set here to avoid incorrect <tab> triger
-- Looks these mappings must be here, or <tab> will triger `UltiSnips#Expand`
-- vim.g['UltiSnipsExpandTrigger'] = '<c-j>'
-- vim.g['UltiSnipsJumpForwardTrigger'] = '<c-j>'
-- vim.g['UltiSnipsJumpBackwardTrigger'] = '<c-k>'

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
            local servers = { 'ltex', 'texlab', 'pyright', 'lua_ls', 'marksman', 'clangd', 'cmake' }
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup {
                    capabilities = capabilities,
                }
            end
            lspconfig['matlab_ls'].setup {
                capabilities = capabilities,
                -- set MATLAB rootpath to `./` in case there is no Git repo
                root_dir = require('lspconfig/util').root_pattern('./'),
            }
            lspconfig['arduino_language_server'].setup {
                cmd = {
                    'arduino-language-server',
                    '-cli-config', '~/.arduino15/arduino-cli.yaml', -- run `arduino-cli config init` first
                    '-fqbn', 'arduino:avr:mega', -- this may be 'arduino:avr:uno'
                    '-cli', '/usr/bin/arduino-cli',
                    '-clangd', '/usr/bin/clangd'
                }
            }
        end
    },

    -- A completion plugin for neovim coded in Lua
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
            'hrsh7th/cmp-path',     -- Enable filesystem path autocompletion
            'hrsh7th/cmp-emoji',    -- Enable emoji autocompletion
            'hrsh7th/cmp-cmdline',  -- Enable command line autocompletion
            'saadparwaiz1/cmp_luasnip'
        },
        config = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')
            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
                            -- elseif luasnip.expand_or_jumpable() then
                            --     luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                            -- elseif luasnip.jumpable(-1) then
                            --     luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'emoji' },
                    { name = 'luasnip' } -- For luasnip users.
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

    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    -- {
    --     'jose-elias-alvarez/null-ls.nvim',
    --     opts = {
    --         sources = {
    --             -- dependency: `:MasonInstall vale`
    --             -- add a `.vale.ini` file to `~/` and run `vale sync` to initialize
    --             -- `.vale.ini` can be generated from: https://vale.sh/generator
    --             -- require('null-ls').builtins.diagnostics.vale,
    --         }
    --     }
    -- },

    -- Snippets, (require `vimtex` and `vim-markdown` to detect math zone)
    -- {
    --     'SirVer/ultisnips',
    --     -- config = function()
    --         -- vim.g['UltiSnipsExpandTrigger'] = '<c-j>'
    --         -- vim.g['UltiSnipsJumpForwardTrigger'] = '<c-j>'
    --         -- vim.g['UltiSnipsJumpBackwardTrigger'] = '<c-k>'
    --     -- end
    -- },

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
            vim.cmd [[
                " Jump forward through tabstops
                imap <silent><expr> <C-j> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-j>'
                smap <silent><expr> <C-j> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-j>'
                " Jump backward through snippet tabstops
                imap <silent><expr> <C-k> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-k>'
                smap <silent><expr> <C-k> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-k>'
                " Cycle forward through choice nodes
                imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
                smap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
            ]]
        end
    }
}
