return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
        "folke/neodev.nvim",
        "nvimtools/none-ls.nvim"
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local servers = {
            clangd = {
                settings = {
                    "clangd",
                    "--suggest-missing-includes",
                    "--background-index",
                },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {
                                'vim',
                                'require'
                            },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            },
            pyright = {}
        }

        require("fidget").setup({})
        local null_ls = require('null-ls')
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.uncrustify,
            }

        })


        vim.keymap.set({ "n" }, "<leader>f", '<cmd>lua vim.lsp.buf.format()<CR>')
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name)  -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = capabilities,
                        settings = servers[server_name].settings,
                    }
                end,
            }
        })
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        -- this is the function that loads the extra snippets to luasnip
        -- from rafamadriz/friendly-snippets
        require('luasnip.loaders.from_vscode').lazy_load()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-i>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'path' },
            }, {
                { name = 'buffer' },
            })
        })


        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(e)
                local opts = { buffer = e.buf }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {desc="Go to definition", buffer=e.buf})
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {desc="Hover"})
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, {desc="List all workspace symbols", buffer=e.buf})
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {desc="Show diagnostics in a floating window", buffer=e.buf})
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, {desc="Select the code actions available at the cursor", buffer=e.buf})
                vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, {desc="Show all references of symbol under cursor", buffer=e.buf})
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, {desc="Rename all instances of symbol under cursor", buffer=e.buf})
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {desc="Show signature help in a floating window", buffer=e.buf})
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, {desc="Go to next diagnostic", buffer=e.buf})
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, {desc="Go to previous diagnostic", buffer=e.buf})
            end
        })
    end
}
