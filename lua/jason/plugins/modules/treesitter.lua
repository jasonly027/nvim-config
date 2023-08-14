local M = {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
}

M.opts = {
    ensure_installed = { "c", "lua", "vim", "vimdoc" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}

M.config = function()
    local opt = vim.opt

    -- Line folding using treesitter
    opt.foldmethod = "expr"
    opt.foldexpr = "nvim_treesitter#foldexpr()"
    opt.foldenable = true
    vim.api.nvim_create_autocmd('BufRead', {
        callback = function()
            vim.api.nvim_create_autocmd('BufWinEnter', {
                once = true,
                callback = function()
                    vim.cmd [[normal! zx]]
                    vim.cmd [[normal! zR]]
                end
            })
        end
    })
end

return M
