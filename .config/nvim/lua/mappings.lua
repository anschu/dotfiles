vim.keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true })
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<esc>', vim.cmd.noh, { silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader><tab>', '<C-^>', { desc = 'Last buffer', silent = true })

vim.keymap.set('n', '<leader>wd', vim.cmd.quit, { desc = 'Close', silent = true })
vim.keymap.set('n', '<leader>w-', vim.cmd.split, { desc = 'Split', silent = true })
vim.keymap.set('n', '<leader>w\\', vim.cmd.vsplit, { desc = 'VSplit', silent = true })

vim.keymap.set('n', '<leader>e', '<CMD>Explore<CR>', { desc = 'File Explorer' })
vim.keymap.set('n', '<leader>ol', '<CMD>Lazy<CR>', { desc = 'Lazy' })
vim.keymap.set(
  'n',
  '<leader>og',
  '<CMD>!tmux new-window -c ' .. vim.fn.getcwd() .. ' -- lazygit <CR><CR>',
  { desc = 'LazyGit', silent = true }
)

vim.keymap.set(
  'n',
  '<leader>oc',
  '<CMD>!tmux new-window -c ' .. vim.fn.getcwd() .. ' -- lazydocker <CR><CR>',
  { desc = 'LazyDocker', silent = true }
)

vim.keymap.set("n", "=", [[<cmd>vertical resize +5<cr>]])
vim.keymap.set("n", "-", [[<cmd>vertical resize -5<cr>]])
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]])
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]])
