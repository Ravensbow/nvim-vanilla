--Przenoszenie lini w visual modzie
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--Kursor zostaje na miejscu po przerzucaniu dolnej lini do obecnej
vim.keymap.set("n", "J", "mzJ`z")
--Kursor jest wycentrowny przy half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--Kursor wycentrowany przy skakaniu w wyszukiwaniu
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
--pastowanie na cos bez zastepowania paste buffer tym co bylo zaznaczone 
--vim.keymap.set("x", "<leader>p", "\"_dP")
--kopiowanie rowniez do systemowego schowka
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--LSP
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>')
require("config.lsp_keymaps")
--Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope find git files' })
vim.keymap.set('n', '<leader>/', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")})
end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>:', builtin.command_history, { desc = 'Telescope command history' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope recent files' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Telescope git status' })
vim.keymap.set('n', '<leader>gS', builtin.git_stash, { desc = 'Telescope git stash' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Telescope git commits' })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Telescope git branches' })
vim.keymap.set('n', '<leader>fall', builtin.builtin, { desc = 'Telescope all builtin pickers' })

vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Goto definition' })
vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Show all references' })
vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = 'Goto implementation' })
vim.keymap.set('n', 'gy', builtin.lsp_type_definitions, { desc = 'Goto type definition' })
vim.keymap.set('n', '<leader>xx', builtin.diagnostics, { desc = 'Diagnostics' })
