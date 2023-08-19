local M = {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
}

M.opts = {
    ignore = '^$'
}

return M
