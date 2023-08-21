local M = {
    'nvim-lualine/lualine.nvim',
}

M.opts = {
    options = {
        theme = 'catppuccin',
        globalstatus = true,
        component_separators = '|',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            'lazy',
        }
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { right = '' }, right_padding = 2 },
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = { 'b:gitsigns_status' },
        lualine_x = { 'fileformat', 'encoding' },
        lualine_y = {
            'filetype',
            { 'progress', separator = { right = '' } }
        },
        lualine_z = {
            { "os.date('%I:%M %p')", left_padding = 2 },
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
    vim.api.nvim_set_hl(0, 'lualine_c_normal', { bg = 'NONE' })
end

return M
