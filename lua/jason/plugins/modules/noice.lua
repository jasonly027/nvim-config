local M = {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nui.nvim',
        'nvim-notify',
    }
}

M.opts = {
    presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = true,
        lsp_doc_border = false,
    },
    cmdline = {
        view = 'cmdline',
    },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
        hover = {
            enabled = false,
        },
        signature = {
            enabled = false,
        }
    },
    routes = {
        {
            view = 'notify',
            filter = { event = 'msg_showmode' },
        }
    }
}

return M
