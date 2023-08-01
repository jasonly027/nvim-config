local M = {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
}

M.opts = {
    char = '│',
    filetype_exclude = {
        "help",
        "lazy",
        "mason",
        "notify",
        "terminal",
    },
    show_trailing_blankline_indent = false,
}

return M
