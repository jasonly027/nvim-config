return {
  { -- Colorscheme
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
        auto_integrations = true,
      }

      vim.cmd.colorscheme 'catppuccin-macchiato'
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        globalstatus = true,
        section_separators = '',
        component_separators = '│',
      },
      tabline = {
        lualine_a = {
          {
            'buffers',
            symbols = {
              alternate_file = '',
            },
          },
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
        lualine_x = { 'searchcount' },
        lualine_y = { 'encoding', 'fileformat', 'filetype' },
        lualine_z = { 'location' },
      },
    },
  },

  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  { -- Smooth scroll
    'folke/snacks.nvim',
    priority = 1000,
    opts = {
      scroll = {
        animate = {
          duration = { step = 5, total = 50 },
          easing = 'linear',
        },
      },
    },
  },

  { -- Smooth cursor
    'sphamba/smear-cursor.nvim',
    opts = {
      stiffness = 0.5,
      trailing_stiffness = 0.5,
      matrix_pixel_threshold = 0.5,
    },
  },

  { -- Add indentation guides
    'lukas-reineke/indent-blankline.nvim',
    event = 'VimEnter',
    main = 'ibl',
    config = function()
      require('ibl').setup {
        indent = {
          char = '▏',
        },
      }
    end,
  },

  { -- Highlighting similar words under cursor
    'RRethy/vim-illuminate',
    event = 'VimEnter',
    config = function()
      require('illuminate').configure {
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { 'lsp' },
        },
      }
    end,
  },
}
