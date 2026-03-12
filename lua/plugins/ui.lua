return {
  { -- Colorscheme
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
        auto_integrations = true,
        float = {
          transparent = true,
          solid = false,
        },
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
            fmt = function(name, ctx)
              if vim.bo.filetype == 'toggleterm' then
                return 'Terminal ' .. vim.b.toggle_number
              end
              return name
            end,
          },
        },
        lualine_x = { 'vim.fn.wordcount().visual_chars' },
        lualine_y = { 'encoding', 'fileformat', 'filetype' },
        lualine_z = { { 'location', separator = '' }, 'progress' },
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
    config = function(_, opts)
      require('snacks').setup(opts)

      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniFilesActionRename',
        callback = function(event)
          Snacks.rename.on_rename_file(event.data.from, event.data.to)
        end,
      })
    end,
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

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
        },
        hover = {
          silent = true,
        },
        signature = {
          enabled = false,
          auto_open = {
            enabled = false,
          },
        },
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
}
