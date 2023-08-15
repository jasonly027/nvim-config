local map = vim.keymap.set

-- Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
map("", "<Space>", "<Nop>")



--- NORMAL ---

-- Navigate Windows
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize Windows
map({ "n", "t" }, "<C-Up>", "<cmd>resize +3<cr>", { desc = "Increase window height" })
map({ "n", "t" }, "<C-Down>", "<cmd>resize -3<cr>", { desc = "Decrease window height" })
map({ "n", "t" }, "<C-Left>", "<cmd>vertical resize -3<cr>", { desc = "Decrease window width" })
map({ "n", "t" }, "<C-Right>", "<cmd>vertical resize +3<cr>", { desc = "Increase window width" })

-- Navigate Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Move Line(s)
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line(s) up" })
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line(s) down" })

-- Open vertical split terminal
map("n", "<C-_>", [[:vs | vertical resize 80 | :startinsert | terminal ./]], { desc = "Vertical split terminal" })

-- Toggle relative line number
map("n", "<leader>=", "<cmd>set invrelativenumber<cr>")

-- Yank to system clipboard
map("n", "<leader>Y", [["+Y]])

-- Substitute word under cursor everywhere in file
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute word under cursor" })

-- Traversing word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Keep cursor in place while joining lines
map("n", "J", "mzJ`z")

-- Move half page up/down while staying cenetered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Go to next/previous search result while staying centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")



--- INSERT ---

-- Exit Insert Mode
map("i", "<C-c>", "<esc>")

-- Move Line(s)
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line(s) down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line(s) up" })



--- VISUAL ---

-- Move Line(s)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move line(s) down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move line(s) up" })

-- Stay in visual mode while changing indent
map("v", "<", "<gv^", { desc = "Shift line left" })
map("v", ">", ">gv^", { desc = "Shift line right" })



--- TERMINAL ---

-- Navigate to other windows
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })

-- Close terminal with ESC
map("t", "<esc>", [[<C-\><C-n><cmd>q!<cr>]])


--- MULTIPLE MODES ---

-- Yank to system clipboard
map({ "n", "v" }, "<leader>y", [["+y]])

-- Save File
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Unhighlight Search
map({ "n", "i" }, "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Escape and unhighlight search" })
