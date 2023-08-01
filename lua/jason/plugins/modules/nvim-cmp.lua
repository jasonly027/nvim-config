local M = {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        { 'hrsh7th/cmp-buffer' },
        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'rafamadriz/friendly-snippets' },
    },

    config = function()
        require('lsp-zero.cmp').extend()

        local cmp = require('cmp')
        local cmp_action = require('lsp-zero').cmp_action()

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        require("luasnip.loaders.from_vscode").lazy_load()
        local kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲",
        }

        cmp.setup({
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<Tab>'] = cmp_action.luasnip_next_or_expand(),
                ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                ['<C-b>'] = cmp_action.luasnip_jump_backward(),
            },
            sources = {
                {
                    name = 'nvim_lsp',
                    entry_filter = function(entry, ctx)
                        return require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
                    end
                },

                { name = 'luasnip' },
            },
            formatting = {
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
                    -- Sources
                    vim_item.menu = ({
                        buffer = "Buffer",
                        nvim_lsp = "LSP",
                        luasnip = "Snippet",
                        nvim_lua = "Lua",
                        latex_symbols = "LaTeX",
                    })[entry.source.name]
                    return vim_item
                end
            },
            completion = {
                keyword_length = 2,
            },
        })
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
    end
}

return M
