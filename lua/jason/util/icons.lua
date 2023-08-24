local M = {
    diagnostics = {
        error = ' ',
        warn = ' ',
        hint = ' ',
        info = ' ',
    },
    git = {
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
}

return M
