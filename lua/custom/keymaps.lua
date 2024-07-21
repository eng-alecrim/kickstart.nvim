-- Shorten function name
local keymap = vim.keymap.set

-- primeagen
vim.g.mapleader = ' '
keymap('n', '<leader>pv', vim.cmd.Ex)
