return {
  {
    'folke/which-key.nvim',
    opts = {
      defaults = {
        ['<leader>t'] = { name = 'Test' },
      },
    },
  },

  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'haydenmeade/neotest-jest',
      'marilari88/neotest-vitest',
      'rouge8/neotest-rust',
    },
    keys = function()
      local nt = require('neotest')
      return {
        {
          '<leader>tt',
          function() nt.run.run(vim.fn.expand('%')) end,
          desc = 'Run File',
        },
        {
          '<leader>tT',
          function() nt.run.run(vim.loop.cwd()) end,
          desc = 'Run All Test Files',
        },
        {
          '<leader>tr',
          function() nt.run.run() end,
          desc = 'Run Nearest',
        },
        {
          '<leader>ts',
          function() nt.summary.toggle() end,
          desc = 'Toggle Summary',
        },
        {
          '<leader>to',
          function() nt.output_panel.toggle() end,
          desc = 'Toggle Output Panel',
        },
        {
          '<leader>tS',
          function() nt.run.stop() end,
          desc = 'Stop',
        },
        {
          '<leader>td',
          function() nt.run.run({ strategy = 'dap' }) end,
          desc = 'Debug',
        },
      }
    end,
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-vitest')({}),
          require('neotest-jest')({
            jestCommand = 'npm test --',
            jestConfigFile = 'jest.config.js',
            env = { CI = true },
            cwd = vim.fn.getcwd,
          }),
          require('neotest-rust')({
            args = { '--no-capture' },
            dap_adapter = 'lldb',
          }),
        },
      })
    end,
  },
}
