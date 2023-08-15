local M = {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
    }
}

M.keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
}

M.opts = {
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                require("neo-tree.command").execute({ action = "close" })
            end
        },
    },
    filesystem = {
        hijack_netrw_behavior = "open_current",
        follow_current_file = {
            enabled = true,
        }
    },
    window = {
        width = 30,
        mappings = {
            ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
            ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
        }
    },
}

return M
