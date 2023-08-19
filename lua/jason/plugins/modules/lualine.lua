local M = {
    'nvim-lualine/lualine.nvim',
}

M.opts = {
    options = {
        theme = 'catppuccin',
        globalstatus = true,
        component_separators = '|',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            'lazy',
        }
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'b:gitsigns_status' },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { "os.date('%I:%M %p')", separator = { right = '' }, left_padding = 2 },
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

return M
