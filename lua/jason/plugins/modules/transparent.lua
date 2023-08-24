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
            'BufferLineFill',
            'lualine_c_normal',
			'lualine_c_diff_added_command',
			'lualine_c_diff_added_inactive',
			'lualine_c_diff_added_insert',
			'lualine_c_diff_added_normal',
			'lualine_c_diff_added_replace',
			'lualine_c_diff_added_terminal',
			'lualine_c_diff_added_visual',
			'lualine_c_diff_modified_command',
			'lualine_c_diff_modified_inactive',
			'lualine_c_diff_modified_insert',
			'lualine_c_diff_modified_normal',
			'lualine_c_diff_modified_replace',
			'lualine_c_diff_modified_terminal',
			'lualine_c_diff_modified_visual',
			'lualine_c_diff_removed_command',
			'lualine_c_diff_removed_inactive',
			'lualine_c_diff_removed_insert',
			'lualine_c_diff_removed_normal',
			'lualine_c_diff_removed_replace',
			'lualine_c_diff_removed_terminal',
			'lualine_c_diff_removed_visual',
        }
    })
end

return M
