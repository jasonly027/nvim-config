return {
  'echasnovski/mini.nvim',
  config = function()
    -- Icons
    require('mini.icons').setup()

    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }

    require('mini.surround').setup {
      n_lines = 500,
      mappings = {
        add = 'ys',
        delete = 'ds',
        replace = 'cs',

        find = '""',
        find_left = '""',
        highlight = '""',
        suffix_last = 'l',
        suffix_next = 'n',
      },
    }

    -- Auto insert closing ]})
    require('mini.pairs').setup {
      mappings = {
        ['"'] = false,
        ["'"] = false,
        ['`'] = false,
      },
    }

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

    -- Home Page
    local starter = require 'mini.starter'
    starter.setup {
      items = {
        { name = 'Most Recent', action = 'lua require("persistence").load({ last = true })', section = 'Session' },
        { name = 'Restore', action = 'lua require("persistence").select()', section = 'Session' },
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
  end,
}
