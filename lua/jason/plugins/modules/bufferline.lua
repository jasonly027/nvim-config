local M = {
    'akinsho/bufferline.nvim',
    event = { "BufReadPost", "BufNewFile" },
    version = '*',
    dependencies = {
        'nvim-web-devicons',
        'catppuccin',
    }
}

M.config = function()
    require('bufferline').setup({
        highlights = require('catppuccin.groups.integrations.bufferline').get(),
        options = {
            style_preset = require('bufferline').style_preset.no_italic,
            close_command = "bdelete %d",
            right_mouse_command = "bdelete %d",
            separator_style = 'slant',
            diagnostics = 'nvim_lsp',
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = 'Explorer',
                    text_align = 'center',
                    highlight = 'Directory',
                    separator = true,
                },
                {
                    filetype = 'undotree',
                    text = 'Undo Tree',
                    text_align = 'center',
                    highlight = 'Directory',
                    separator = true,
                },
            },
            show_close_icon = false,
        },
    })
end

return M
