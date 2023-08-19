local M = {
    "folke/trouble.nvim",
}

M.keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Toggle Trouble Workspace Diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Toggle Trouble Document Diagnostics" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Toggle Trouble Quickfix" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Toggle Trouble Loclist" },
    { "gr", "<cmd>TroubleToggle lsp_references<cr>", desc = "Toggle Trouble References" },
}

return M
