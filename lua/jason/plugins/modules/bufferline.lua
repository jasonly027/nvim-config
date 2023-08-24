local M = {
    'akinsho/bufferline.nvim',
    event = { "BufReadPost", "BufNewFile" },
    version = '*',
    dependencies = {
        'nvim-web-devicons',
        'catppuccin',
    }
}

M.keys = {
    { '<leader>1', '<cmd>BufferLineGoToBuffer 1<cr>', desc = 'Go to first bufferline tab' },
    { '<leader>2', '<cmd>BufferLineGoToBuffer 2<cr>', desc = 'Go to second bufferline tab' },
    { '<leader>3', '<cmd>BufferLineGoToBuffer 3<cr>', desc = 'Go to third bufferline tab' },
    { '<leader>4', '<cmd>BufferLineGoToBuffer 4<cr>', desc = 'Go to fourth bufferline tab' },
    { '<leader>5', '<cmd>BufferLineGoToBuffer 5<cr>', desc = 'Go to fifth bufferline tab' },
    { '<leader>6', '<cmd>BufferLineGoToBuffer 6<cr>', desc = 'Go to sixth bufferline tab' },
    { '<leader>7', '<cmd>BufferLineGoToBuffer 7<cr>', desc = 'Go to seventh bufferline tab' },
    { '<leader>8', '<cmd>BufferLineGoToBuffer 8<cr>', desc = 'Go to eigth bufferline tab' },
    { '<leader>9', '<cmd>BufferLineGoToBuffer 9<cr>', desc = 'Go to ninth bufferline tab' },
    { '<leader>0', '<cmd>BufferLineGoToBuffer 0<cr>', desc = 'Go to tenth bufferline tab' },
}

M.config = function()
    require('bufferline').setup({
        highlights = require('catppuccin.groups.integrations.bufferline').get(),
        options = {
            style_preset = require('bufferline').style_preset.no_italic,
            numbers = 'ordinal',
            close_command = "bdelete %d",
            right_mouse_command = "bdelete %d",
            separator_style = { '', '' },
            indicator = {
                style = 'none',
            },
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
            buffer_close_icon = false,
        },
    })
end

return M
