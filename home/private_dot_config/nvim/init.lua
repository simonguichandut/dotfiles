vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Let Neo-tree handle directory buffers.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- lazy
require("config.lazy")

-- Vim imports
-- vim.cmd.colorscheme("evening")

vim.opt.modeline = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.visualbell = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.textwidth = 79
vim.opt.formatoptions = "tcqrn1"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.matchpairs:append("<:>")
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.fillchars:append({
  vert = "┃",
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
})
vim.keymap.set("n", "<leader>q", "gqip")
vim.keymap.set("n", "<leader>l", "<cmd>set list!<cr>")
vim.keymap.set({ "n", "v" }, "gy", '"+y')
