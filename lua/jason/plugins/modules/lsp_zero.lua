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
                    omit = {},
                },
            })
        end
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local lsp = require('lsp-zero')

            lsp.on_attach(function(client, bufnr)
                lsp.buffer_autoformat()
            end)

            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("mason-lspconfig").setup_handlers {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = lsp_capabilities
                    }
                end,
            }

            lsp.setup()
        end
    }
}

return M
