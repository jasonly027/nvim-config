local M = {
    -- Lsp-Zero Settings
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        config = function()
            require('lsp-zero.settings').preset({
                name = 'minimal',
                set_lsp_keymaps = {
                    preserve_mappings = true,
                    omit = {
                        'gr',
                    },
                },
            })
        end,
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                "folke/neodev.nvim",
                opts = {
                    library = { plugins = { "nvim-dap-ui" }, types = true },
                },
            },
        },
        config = function()
            local lsp = require('lsp-zero')

            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = lsp_capabilities
                    }
                end,
                ['lua_ls'] = function()
                    require('lspconfig').lua_ls.setup({
                        on_attach = lsp.on_attach,
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false,
                                }
                            }
                        }
                    })
                end
            }

            lsp.set_sign_icons({
                error = '',
                warn = '',
                hint = '',
                info = ''
            })

            lsp.setup()
        end
    }
}

return M
