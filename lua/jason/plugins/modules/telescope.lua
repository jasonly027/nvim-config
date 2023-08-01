local M = {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build =
            'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
    }
}

M.keys = {
    { '<leader><leader>', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<leader>g',        '<cmd>Telescope live_grep<cr>',  desc = 'Live Grep' },
    { '<leader>b',        '<cmd>Telescope buffers<cr>',    desc = 'Buffers' },
    { '<leader>h',        '<cmd>Telescope help_tags<cr>',  desc = 'Help Tags' },
}

M.config = function()
    require('telescope').load_extension('fzf')
end

return M
