local M = {
    'rcarriga/nvim-notify'
}

M.config = function()
    require("notify").setup({
        render = "minimal",
        stages = "fade",
        top_down = false,
        background_colour = "#000000",
    })
    vim.notify = require('notify')
end

return M
