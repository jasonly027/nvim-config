local M = {
    'utilyre/barbecue.nvim',
    event = { "BufReadPost", "BufNewFile" },
    name = 'barbecue',
    version = '*',
    dependencies = {
        'SmiteshP/nvim-navic',
        'nvim-web-devicons',
    },
}

M.config = function()
    require('barbecue').setup({
        theme = 'catppuccin',
        context_follow_icon_color = true,
    })
end

return M
