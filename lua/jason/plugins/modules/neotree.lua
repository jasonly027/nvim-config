local M = {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
        "nui.nvim",
    }
}

M.keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
}

M.opts = {
    hide_root_node = true,
    sources = {
        "filesystem",
        -- "buffers",
        "git_status",
        "document_symbols",
    },
    source_selector = {
        winbar = true,
        content_layout = "center",
        tabs_layout = "equal",
        show_separator_on_edge = true,
        sources = {
            { source = "filesystem", display_name = "󰉓 Files" },
            -- { source = "buffers", display_name = "󰈙 Bufs" },
            { source = "git_status", display_name = " Git" },
            { source = "document_symbols", display_name = " Symbols" },
        },
    },
    git_status = {
        symbols = {
            -- Change type
            added     = " ✚",
            deleted   = " ✖",
            modified  = " ",
            renamed   = " 󰁕",
            -- Status type
            untracked = " ",
            ignored   = " ",
            unstaged  = " 󰄱",
            staged    = " ",
            conflict  = " ",
        },
        align = "right",
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                require("neo-tree.command").execute({ action = "close" })
            end
        },
    },
    default_component_configs = {
        container = {
            enable_character_fade = false,
        },
    },
    filesystem = {
        hijack_netrw_behavior = "open_current",
        group_empty_dirs = true,
        follow_current_file = true,
    },
    window = {
        width = 30,
    },
}

return M
