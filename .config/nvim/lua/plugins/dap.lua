return {
  {
    'folke/which-key.nvim',
    opts = {
      defaults = {
        ['<leader>d'] = { name = 'Debug' },
      },
    },
  },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      { 'theHamsta/nvim-dap-virtual-text', opts = {} },
    },
    keys = function()
      local dap = require('dap')
      return {
        {
          '<leader>dB',
          function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
          desc = 'Breakpoint Condition',
        },
        { '<leader>db', dap.toggle_breakpoint, desc = 'Toggle Breakpoint' },
        { '<leader>dc', dap.continue,          desc = 'Continue' },
        { '<leader>dd', dap.continue,          desc = 'Continue' },
        { '<leader>dC', dap.run_to_cursor,     desc = 'Run to Cursor' },
        { '<leader>dg', dap.goto_,             desc = 'Go to line (no execute)' },
        { '<leader>di', dap.step_into,         desc = 'Step Into' },
        { '<leader>dj', dap.down,              desc = 'Down' },
        { '<leader>dk', dap.up,                desc = 'Up' },
        { '<leader>dl', dap.run_last,          desc = 'Run Last' },
        { '<leader>do', dap.step_out(),        desc = 'Step Out' },
        { '<leader>dO', dap.step_over,         desc = 'Step Over' },
        { '<leader>dp', dap.pause,             desc = 'Pause' },
        { '<leader>dr', dap.repl.toggle,       desc = 'Toggle REPL' },
        { '<leader>ds', dap.session,           desc = 'Session' },
        { '<leader>dx', dap.terminate,         desc = 'Terminate' },
      }
    end,
    config = function()
      local dap = require('dap')
      if not dap.adapters['pwa-node'] then
        require('dap').adapters['pwa-node'] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'node',
            args = {
              require('mason-registry').get_package('js-debug-adapter'):get_install_path()
              .. '/js-debug/src/dapDebugServer.js',
              '${port}',
            },
          },
        }
      end
      for _, language in ipairs({ 'typescript', 'javascript' }) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = 'pwa-node',
              request = 'launch',
              name = 'Launch file',
              program = '${file}',
              cwd = '${workspaceFolder}',
            },
          }
        end
      end

      dap.adapters.php = {
        type = 'executable',
        command = 'node',
        args = {
          require('mason-registry').get_package('php-debug-adapter'):get_install_path() ..
          '/extension/out/phpDebug.js'
        }
      }

      dap.configurations.php = {
        {
          type = 'php',
          request = 'launch',
          name = 'Listen for Xdebug',
          port = 9003,
          log = true,
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}"
          }
        }
      }
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    keys = function()
      local dapui = require('dapui')
      return {
        { '<leader>du', dapui.toggle, desc = 'Dap UI' },
        { '<leader>de', dapui.eval,   desc = 'Eval',  mode = { 'n', 'v' } },
      }
    end,
    opts = {},
    config = function(_, opts)
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup(opts)
      dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  },
}
