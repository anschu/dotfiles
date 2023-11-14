return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  {
    'williamboman/mason.nvim',
    lazy = false,
    keys = {
      { '<leader>om', vim.cmd.Mason, desc = 'Mason' },
    },
    opts = {
      ensure_installed = {
        'stylua',
        'js-debug-adapter',
        'codelldb',
        'prettier',
        'phpcs',
        'phpcbf',
        'shellcheck',
        'shfmt',
        'sqlfluff',
        'php-debug-adapter',
      },
    },
    config = function(_, opts)
      require('mason').setup(opts)
      local mr = require('mason-registry')

      local ensure_installed = function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then p:install() end
        end
      end

      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim',        tag = 'legacy',                            opts = {} },
      { 'simrat39/rust-tools.nvim', dependencies = { 'mfussenegger/nvim-dap' } },
    },
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })

        local map = function(mode, keys, func, desc) vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc }) end

        require('which-key').register({
          ['<leader>c'] = { name = 'Code' },
          ['<leader>cl'] = { name = 'Lsp' },
        }, { buffer = bufnr })

        map('n', '<leader>cli', vim.cmd.LspInfo, 'Lsp Info')
        map('n', '<leader>cll', vim.cmd.LspLog, 'Lsp Log')
        map('n', '<leader>clr', vim.cmd.LspRestart, 'Lsp Restart')

        map('n', '<leader>cr', vim.lsp.buf.rename, 'Rename')
        map('n', '<leader>cf', function() vim.lsp.buf.format({ async = true }) end, 'Format Code')
        map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code Action')
      end)

      lsp_zero.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['lua_ls'] = { 'lua' },
          ['rust_analyzer'] = { 'rust' },
          -- ['eslint'] = { 'javascript', 'typescript', 'vue' },
        },
      })

      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'eslint',
          'rust_analyzer',
          'taplo',
          'volar',
          'html',
          'emmet_ls',
          'dockerls',
          'docker_compose_language_service',
          'intelephense',
          'yamlls',
          'bashls',
          'jsonls',
          'sqlls'
        },
        handlers = {
          lsp_zero.default_setup,
          rust_analyzer = require('plugins.lsp.rust_analyzer'),
          taplo = require('plugins.lsp.taplo'),
          volar = require('plugins.lsp.volar'),
        },
      })
    end,
  },
}
