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
            'lualine_x_diagnostics_error_command',
            'lualine_x_diagnostics_error_inactive',
            'lualine_x_diagnostics_error_insert',
            'lualine_x_diagnostics_error_normal',
            'lualine_x_diagnostics_error_replace',
            'lualine_x_diagnostics_error_terminal',
            'lualine_x_diagnostics_error_visual',
            'lualine_x_diagnostics_hint_command',
            'lualine_x_diagnostics_hint_inactive',
            'lualine_x_diagnostics_hint_insert',
            'lualine_x_diagnostics_hint_normal',
            'lualine_x_diagnostics_hint_replace',
            'lualine_x_diagnostics_hint_terminal',
            'lualine_x_diagnostics_hint_visual',
            'lualine_x_diagnostics_info_command',
            'lualine_x_diagnostics_info_inactive',
            'lualine_x_diagnostics_info_insert',
            'lualine_x_diagnostics_info_normal',
            'lualine_x_diagnostics_info_replace',
            'lualine_x_diagnostics_info_terminal',
            'lualine_x_diagnostics_info_visual',
            'lualine_x_diagnostics_warn_command',
            'lualine_x_diagnostics_warn_inactive',
            'lualine_x_diagnostics_warn_insert',
            'lualine_x_diagnostics_warn_normal',
            'lualine_x_diagnostics_warn_replace',
            'lualine_x_diagnostics_warn_terminal',
            'lualine_x_diagnostics_warn_visual',
        }
    })
end

return M
