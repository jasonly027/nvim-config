local M = {
    'kevinhwang91/nvim-ufo',
    lazy = false,
    dependencies = {
        'nvim-treesitter',
        'kevinhwang91/promise-async',
    },
}

M.keys = {
    { 'zR', function() require('ufo').openAllFolds() end,  desc = 'Open all folds' },
    { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
}

M.config = function()
    require('ufo').setup({
        open_fold_hl_timeout = 0,
        provider_selector = function(bufnr, filetype, buftype)
            return { 'treesitter', 'indent' }
        end,
    })

    local opt = vim.opt
    opt.foldcolumn = '0' -- '0' is not bad
    opt.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
    opt.foldlevelstart = 99
    opt.foldenable = true
end

return M
