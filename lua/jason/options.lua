-- Set Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set Options
local opt = vim.opt
opt.backup = false
opt.completeopt = { "menuone", "noselect" }
if vim.fn.has("win32") == 1 then
    opt.clipboard = "unnamedplus"
end
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
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]

-- Disable line numbers in integrated terminal
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function ()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
    end,
    pattern = '*',
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
