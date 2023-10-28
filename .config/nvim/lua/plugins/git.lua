return {
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gwrite' },
  },
  'tpope/vim-rhubarb',
  {
    'ThePrimeagen/git-worktree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        require('which-key').register({ ['<leader>g'] = { name = 'Git' } })

        vim.keymap.set(
          'n',
          '<leader>gp',
          require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = 'Preview git hunk' }
        )

        vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { buffer = bufnr, desc = 'Status' })
        vim.keymap.set('n', '<leader>ga', vim.cmd.GWrite, { buffer = bufnr, desc = 'Add' })

        vim.keymap.set(
          'n',
          '<leader>gw',
          function() require('telescope').extensions.git_worktree.git_worktrees() end,
          { desc = 'Worktrees' }
        )
        vim.keymap.set(
          'n',
          '<leader>gc',
          function() require('telescope').extensions.git_worktree.create_git_worktree() end,
          { desc = 'Create worktree' }
        )

        local gs = package.loaded.gitsigns
        vim.keymap.set({ 'n', 'v' }, ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
        vim.keymap.set({ 'n', 'v' }, '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
      end,
    },
  },
}
