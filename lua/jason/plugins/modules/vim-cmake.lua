local M = {
    'cdelledonne/vim-cmake',
    cmd = {
        'CMakeGenerate',
        'CMakeClean',
        'CMakeBuild',
        'CMakeInstall',
        'CMakeTest',
        'CMakeSwitch',
        'CMakeOpen',
        'CMakeClose',
        'CMakeStop',
    }
}

M.keys = {
    { '<leader>cm', '<cmd>CMakeOpen<cr><C-w>j', desc = 'Open CMake console window and focus it' }
}

return M
