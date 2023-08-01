-- Set Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set Options
local opt = vim.opt
opt.backup = false
opt.clipboard = "unnamedplus"
opt.cmdheight = 1
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.mouse = "a"
opt.pumheight = 10
opt.showmode = false
opt.smartcase = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.updatetime = 250
opt.writebackup = false
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 4
opt.signcolumn = "yes"
opt.wrap = true
opt.colorcolumn = "80"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- Broken

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
