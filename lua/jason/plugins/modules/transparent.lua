local M = {
    'xiyaowong/transparent.nvim',
    lazy = false,
}

M.keys = {
    { '<leader>-', '<cmd>TransparentToggle<cr>', desc = 'Toggle Transparent Background' }
}

M.config = function()
    require("transparent").setup({
        extra_groups = {
            'NormalFloat',
            'NeoTreeNormal',
            'TroubleNormal',
        }
    })
end

return M
