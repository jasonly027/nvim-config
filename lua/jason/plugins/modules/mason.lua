local M = {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    build = function()
        pcall(vim.api.nvim_command, 'MasonUpdate')
    end,
}

M.config = true

return M
