local M = {
    'nvim-lualine/lualine.nvim',
}

M.opts = {
    options = {
        theme = 'catppuccin',
        globalstatus = true,
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            { 'mode', right_padding = 2 },
        },
        lualine_b = {
            { 'filename', separator = { left = '' } },
            'branch',
        },
        lualine_c = { 'diff' },
        lualine_x = {
            {
                'diagnostics',
                symbols = require('jason.util.icons').diagnostics
            },
            'fileformat',
            'encoding'
        },
        lualine_y = {
            'filetype',
            'progress',
        },
        lualine_z = {
            { "os.date('%I:%M %p')", left_padding = 2, separator = { left = '' } },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
}

M.config = function()
    require('lualine').setup(M.opts)
end

return M
