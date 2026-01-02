return {
  'tpope/vim-surround',

  {
    'ggandor/leap.nvim',
    lazy = false, -- Not recommended by author
    keys = {
      { 's', '<Plug>(leap)', mode = { 'n', 'x', 'o' } },
      { 'S', '<Plug>(leap-from-window)' },
    },
    opts = {},
  },

  {
    'kawre/neotab.nvim',
    event = 'InsertEnter',
    opts = {},
  },

  {
    'NMAC427/guess-indent.nvim',
    event = 'BufEnter',
    opts = {},
  },

  { -- Show gitsigns in gutter
    'lewis6991/gitsigns.nvim',
    event = 'VimEnter',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Show pending keybinds
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      delay = 300,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or { -- Strings used if no Nerd Font
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  {
    'akinsho/toggleterm.nvim',
    keys = {
      { '<C-\\>', mode = { 'n', 't' } },
    },
    config = function()
      -- Use Powershell if it's installed
      if vim.fn.executable 'pwsh' == 1 then
        local powershell_options = {
          shell = 'pwsh',
          shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
          shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
          shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
          shellquote = '',
          shellxquote = '',
        }

        for option, value in pairs(powershell_options) do
          vim.opt[option] = value
        end
      end

      require('toggleterm').setup()

      local function toggleOrInitTerm()
        vim.cmd [[ ToggleTermToggleAll ]]

        -- list current buffers
        local buffers = vim.api.nvim_list_bufs()

        -- check if toggleterm buffer exists. If not then create one by vim.cmd [[ exe 1 . "ToggleTerm" ]]
        local toggleterm_exists = false
        for _, buf in ipairs(buffers) do
          local buf_name = vim.api.nvim_buf_get_name(buf)
          if buf_name:find 'toggleterm#' then
            toggleterm_exists = true
            break
          end
        end

        if not toggleterm_exists then
          vim.cmd [[ exe 1 . "ToggleTerm" ]]
        end
      end

      vim.keymap.set('n', '<C-\\>', toggleOrInitTerm)
      vim.keymap.set('t', '<C-\\>', toggleOrInitTerm)

      vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window' })
      vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window' })
      vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window' })
      vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window' })
    end,
  },
}
