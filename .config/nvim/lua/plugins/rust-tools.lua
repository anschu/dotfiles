return {
  'simrat39/rust-tools.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'mfussenegger/nvim-dap',
  },
  opts = function()
    local ok, mason_registry = pcall(require, 'mason-registry')
    local adapter

    if ok then
      local codelldb = mason_registry.get_package('codelldb')
      local extension_path = codelldb:get_install_path() .. '/extension/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
      adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    end

    return {
      tools = {
        hover_actions = {
          auto_focus = true,
        },
        on_initialized = function()
          vim.cmd([[
                  augroup RustLSP
                    autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                    autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                    autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                  augroup END
                ]])
        end,
      },
      server = {
        on_attach = function(_, bufnr)
          local rust_tools = require('rust-tools')
          -- vim.keymap.set('n', 'K', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set('n', '<C-space>', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
          vim.keymap.set(
            'n',
            '<leader>ca',
            rust_tools.code_action_group.code_action_group,
            { buffer = bufnr, desc = 'Code actions' }
          )
        end,
        settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            checkOnSave = {
              allFeatures = true,
              command = 'clippy',
              extraArgs = { '--no-deps' },
            },
            procMacro = {
              enable = true,
              ignored = {
                ['async-trait'] = { 'async_trait' },
                ['napi-derive'] = { 'napi' },
                ['async-recursion'] = { 'async_recursion' },
              },
            },
          },
        },
      },
      dap = {
        adapter = adapter,
      },
    }
  end,
}
