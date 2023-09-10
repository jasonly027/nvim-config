local M = {
    'jakemason/ouroboros',
    requires = { 'plenary.nvim' },
    lazy = false
}

M.cmd = {
    'Ouroboros'
}

M.keys = {
    { '<leader>o', '<cmd>Ouroboros<cr>', desc = 'Switch between header and implementation file' }
}

return M
