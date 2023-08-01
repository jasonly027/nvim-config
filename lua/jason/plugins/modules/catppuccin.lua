local M = {
    "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000,
}

M.config = function()
    require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = false,
        custom_highlights = function(colors)
            return {
                LineNr = { fg = colors.lavender },
                ColorColumn = { bg = colors.surface1 }
            }
        end,
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.15,
        },
        integrations = {
            mason = true,
            telescope = {
                enabled = true,
            },
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                },
                inlay_hints = {
                    background = true,
                },
            },
            treesitter = true,
            cmp = true,
            notify = true,
            neotree = true,
        }
    })
    vim.cmd.colorscheme("catppuccin")
end

return M
