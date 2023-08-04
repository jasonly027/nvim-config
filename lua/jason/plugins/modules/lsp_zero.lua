local M = {
    -- Lsp-Zero Settings
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        opts = {
            name = 'minimal',
            set_lsp_keymaps = {
                preserve_mappings = true,
                omit = {
                    'gr', -- Unbinded in favor of Trouble's references
                },
            },
        },
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
