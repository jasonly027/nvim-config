local M = {
    'mfussenegger/nvim-dap',
    keys = {
        { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Toggle breakpoint' },
        { '<F5>',       '<cmd>DapContinue<cr>',         desc = 'Start or continue debugger' },
    },
    dependencies = {
        {
            'rcarriga/nvim-dap-ui',
            -- keys = {
            --     { '<leader>db', '<cmd>DapToggleBreakpoint<cr>', desc = 'Toggle breakpoint' },
            --     { '<F5>',       '<cmd>DapContinue<cr>',         desc = 'Start or continue debugger' },
            -- },
            config = function()
                local dap, dapui = require("dap"), require("dapui")
                dapui.setup()
                dap.listeners.after.event_initialized["dapui_config"] = dapui.open
                dap.listeners.before.event_terminated["dapui_config"] = dapui.close
                dap.listeners.before.event_exited["dapui_config"] = dapui.close
            end
        },
        {
            'jay-babu/mason-nvim-dap.nvim',
            dependencies = {
                { 'mason.nvim' },
            },
            opts = {
                automatic_installation = true,
                handlers = {
                    function(config)
                        require('mason-nvim-dap').default_setup(config)
                    end,
                },
            }
        }
    },
}

return M
