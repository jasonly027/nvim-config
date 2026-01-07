return {
  'echasnovski/mini.nvim',
  config = function()
    -- Icons
    require('mini.icons').setup()

    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }

    -- Functionality to work with ([{}])'s
    require('mini.pairs').setup()

    -- File Explorer
    require('mini.files').setup {
      options = {
        permanent_delete = false,
      },
    }
    local function minifiles_toggle()
      if not MiniFiles.close() then
        MiniFiles.open()
      end
    end
    vim.keymap.set('n', '<C-e>', minifiles_toggle, { desc = 'Open File [E]xplorer' })

    -- Move selection
    require('mini.move').setup()

    -- Comment toggling
    local toggleCommentKey = '<C-_>'
    require('mini.comment').setup {
      mappings = {
        comment = 'gc',
        comment_line = toggleCommentKey,
        comment_visual = toggleCommentKey,
        textobject = 'gc',
      },
    }

    -- Scroll bar
    require('mini.map').setup {
      window = {
        width = 1,
        winblend = 0,
        show_integration_count = false,
      },
    }
    vim.api.nvim_create_autocmd('BufEnter', {
      group = vim.api.nvim_create_augroup('kickstart.MiniMap', { clear = true }),
      once = true,
      callback = function()
        MiniMap.open()
      end,
    })

    -- Status line
    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end

    -- Home Page
    local starter = require 'mini.starter'
    starter.setup {
      items = {
        { name = 'Restore', action = 'lua require("persistence").select()', section = 'Session' },
        { name = 'Most Recent', action = 'lua require("persistence").load({ last = true })', section = 'Session' },
        { name = 'Current Directory', action = 'lua require("persistence").load()', section = 'Session' },
        starter.sections.recent_files(10, false),
        starter.sections.builtin_actions(),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
        starter.gen_hook.padding(3, 2),
      },
    }

    -- Tab Line
    require('mini.tabline').setup()
  end,
}
