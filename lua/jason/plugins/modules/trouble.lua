local M = {
    "folke/trouble.nvim",

}

M.keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
    { "<leader>xx", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Trouble Workspace Diagnostics" },
    { "<leader>xw", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Toggle Trouble Document Diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle quickfix<cr>", desc = "Toggle Trouble Quickfix" },
    { "<leader>xq", "<cmd>TroubleToggle loclist<cr>", desc = "Toggle Trouble Loclist" },
}

return M
