-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", vim.diagnostic.open_float, { desc = "Show error message" })

-- goto definition in vertical or horizontal way
vim.keymap.set("n", "gv", function()
  vim.cmd("vsplit")
  vim.lsp.buf.definition()
end, { desc = "Goto definition in vertical split" })

vim.keymap.set("n", "gh", "<C-w>]", { desc = "Goto definition in horizontal split" })

local map = vim.keymap.set

map("n", "<A-h>", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
map("n", "<A-l>", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
